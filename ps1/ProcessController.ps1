# credits: login404
# source: https://community.bitsum.com/forum/index.php?topic=34071.msg67653#msg67653
# =========================================================================
#  ProcessController.ps1
#
#  功能:
#  - 交互式菜单 可实时修改进程的亲和性、优先级、调度优先级、
#    时间片权重、数据包优先级、CPU使用率限制、传出带宽限制、物理内存限制
#  - 支持一次性参数化设置 以便于脚本自动化
#  - 按 Ctrl+C 或输入 'exit' 可随时安全退出并自动解锁所有限制
#
#  用法:
#  1. 交互模式 (无参数运行):
#     > .\ProcessController.ps1
#
#  2. 一次性模式 (提供任意可选参数):
#     > .\ProcessController.ps1 -ProcessName "Game" -Affinity "8 10 12-15" -Priority High -Scheduling 9 -Weight 1 -DSCP 46
#     > .\ProcessController.ps1 -ProcessId 12345 -CpuLimit 5 -NetLimit 256 -Working 1-10
#     Powershell "D:\Portable\ProcessController.ps1" -ProcessName "Game" -Affinity "8,10,12-15"
#
#  警告：必须以管理员身份运行！
# =========================================================================

# 步骤 0: 定义脚本参数 以支持不同的启动模式
param(
    [string]$ProcessName,
    [int]$ProcessId,
    [string]$Affinity,
    [ValidateRange(1,9)]
    [int]$Weight,
    [ValidateRange(0,9)]
    [int]$Scheduling,
    [ValidateRange(1,100)]
    [int]$CpuLimit,
    [ValidateSet("Idle", "BelowNormal", "Normal", "AboveNormal", "High", "RealTime")]
    [string]$Priority,
    [string]$Working,
    [ValidateRange(1, [int]::MaxValue)]
    [int]$NetLimit,
    [ValidateRange(0,63)]
    [int]$DSCP
)

# 步骤 1: 使用 Add-Type 定义所有需要的 Win32 API 签名、结构体和枚举
try {
    Add-Type -TypeDefinition @"
    using System;
    using System.Runtime.InteropServices;

    public static class NativeMethods {
        // --- Job Object API ---
        [DllImport("kernel32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
        public static extern IntPtr CreateJobObjectW(IntPtr lpJobAttributes, string lpName);

        [DllImport("kernel32.dll", SetLastError = true)]
        [return: MarshalAs(UnmanagedType.Bool)]
        public static extern bool AssignProcessToJobObject(IntPtr hJob, IntPtr hProcess);

        // 为 SetInformationJobObject 创建不同的入口点 以处理不同的结构体 避免类型冲突
        [DllImport("kernel32.dll", SetLastError = true, EntryPoint="SetInformationJobObject")]
        public static extern bool SetInformationJobObjectBasic(IntPtr hJob, JOBOBJECT_INFO_CLASS JobObjectInfoClass, ref JOBOBJECT_BASIC_LIMIT_INFORMATION lpJobObjectInfo, uint cbJobObjectInfoLength);

        [DllImport("kernel32.dll", SetLastError = true, EntryPoint="SetInformationJobObject")]
        public static extern bool SetInformationJobObjectCpuRate(IntPtr hJob, JOBOBJECT_INFO_CLASS JobObjectInfoClass, ref JOBOBJECT_CPU_RATE_CONTROL_INFORMATION lpJobObjectInfo, uint cbJobObjectInfoLength);

        [DllImport("kernel32.dll", SetLastError = true, EntryPoint="SetInformationJobObject")]
        public static extern bool SetInformationJobObjectNetRate(IntPtr hJob, JOBOBJECT_INFO_CLASS JobObjectInfoClass, ref JOBOBJECT_NET_RATE_CONTROL_INFORMATION lpJobObjectInfo, uint cbJobObjectInfoLength);

        [DllImport("kernel32.dll", SetLastError = true, EntryPoint="SetInformationJobObject")]
        public static extern bool SetInformationJobObjectNotification(IntPtr hJob, JOBOBJECT_INFO_CLASS JobObjectInfoClass, ref JOBOBJECT_NOTIFICATION_LIMIT_INFORMATION lpJobObjectInfo, uint cbJobObjectInfoLength);

        // 为 QueryInformationJobObject 创建不同的入口点
        [DllImport("kernel32.dll", SetLastError = true, EntryPoint="QueryInformationJobObject")]
        public static extern bool QueryInformationJobObjectBasic(IntPtr hJob, JOBOBJECT_INFO_CLASS i, out JOBOBJECT_BASIC_LIMIT_INFORMATION l, uint s, out uint r);

        [DllImport("kernel32.dll", SetLastError = true, EntryPoint="QueryInformationJobObject")]
        public static extern bool QueryInformationJobObjectCpuRate(IntPtr hJob, JOBOBJECT_INFO_CLASS i, out JOBOBJECT_CPU_RATE_CONTROL_INFORMATION l, uint s, out uint r);

        [DllImport("kernel32.dll", SetLastError = true, EntryPoint="QueryInformationJobObject")]
        public static extern bool QueryInformationJobObjectNetRate(IntPtr hJob, JOBOBJECT_INFO_CLASS i, out JOBOBJECT_NET_RATE_CONTROL_INFORMATION l, uint s, out uint r);

        [DllImport("kernel32.dll", SetLastError = true)]
        [return: MarshalAs(UnmanagedType.Bool)]
        public static extern bool CloseHandle(IntPtr hObject);

        // --- 枚举定义 ---
        public enum JOBOBJECT_INFO_CLASS {
            JobObjectBasicLimitInformation = 2,
            JobObjectNotificationLimitInformation = 12,
            JobObjectCpuRateControlInformation = 15,
            JobObjectNetRateControlInformation = 32
        }

        [Flags]
        public enum JOB_OBJECT_LIMIT_FLAGS : uint {
            JOB_OBJECT_LIMIT_WORKINGSET          = 0x00000001,
            JOB_OBJECT_LIMIT_RATE_CONTROL        = 0x00000004,
            JOB_OBJECT_LIMIT_AFFINITY            = 0x00000010,
            JOB_OBJECT_LIMIT_PRIORITY_CLASS      = 0x00000020,
            JOB_OBJECT_LIMIT_SCHEDULING_CLASS    = 0x00000080,
            JOB_OBJECT_CPU_RATE_CONTROL_ENABLE     = 0x1,
            JOB_OBJECT_CPU_RATE_CONTROL_WEIGHT_BASED = 0x2,
            JOB_OBJECT_CPU_RATE_CONTROL_HARD_CAP   = 0x4,
            JOB_OBJECT_NET_RATE_CONTROL_ENABLE     = 0x1,
            JOB_OBJECT_NET_RATE_CONTROL_MAX_BANDWIDTH = 0x2,
            JOB_OBJECT_NET_RATE_CONTROL_DSCP_TAG   = 0x4
        }

        public enum PROCESS_PRIORITY_CLASS : uint {
            Idle        = 0x40,
            BelowNormal = 0x4000,
            Normal      = 0x20,
            AboveNormal = 0x8000,
            High        = 0x80,
            RealTime    = 0x100
        }

        public enum JOBOBJECT_RATE_CONTROL_TOLERANCE {
            ToleranceLow = 1,
            ToleranceMedium = 2,
            ToleranceHigh = 3
        }

        public enum JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL {
            ToleranceIntervalShort = 1,
            ToleranceIntervalMedium = 2,
            ToleranceIntervalLong = 3
        }

        // --- 结构体定义 ---
        [StructLayout(LayoutKind.Sequential)]
        public struct JOBOBJECT_BASIC_LIMIT_INFORMATION {
            public long p1,p2;
            public JOB_OBJECT_LIMIT_FLAGS LimitFlags;
            public UIntPtr MinimumWorkingSetSize;
            public UIntPtr MaximumWorkingSetSize;
            public uint a;
            public UIntPtr Affinity;
            public uint PriorityClass;
            public uint SchedulingClass;
        }

        [StructLayout(LayoutKind.Explicit)]
        public struct JOBOBJECT_CPU_RATE_CONTROL_INFORMATION {
            [FieldOffset(0)] public JOB_OBJECT_LIMIT_FLAGS ControlFlags;
            [FieldOffset(4)] public uint CpuRate;
            [FieldOffset(4)] public uint Weight;
        }

        [StructLayout(LayoutKind.Sequential)]
        public struct JOBOBJECT_NET_RATE_CONTROL_INFORMATION {
            public ulong MaxBandwidth;
            public JOB_OBJECT_LIMIT_FLAGS ControlFlags;
            public byte DscpTag;
        }

        [StructLayout(LayoutKind.Sequential)]
        public struct JOBOBJECT_NOTIFICATION_LIMIT_INFORMATION {
            public ulong IoReadBytesLimit;
            public ulong IoWriteBytesLimit;
            public long PerJobUserTimeLimit;
            public ulong JobMemoryLimit;
            public JOBOBJECT_RATE_CONTROL_TOLERANCE RateControlTolerance;
            public JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL RateControlToleranceInterval;
            public JOB_OBJECT_LIMIT_FLAGS LimitFlags;
        }
    }
"@ -PassThru -ErrorAction Stop | Out-Null
} catch {
    Write-Host "C# 编译失败: $($_.Exception.Message)" -ForegroundColor Red
    return
}

# --- 步骤 2: 辅助函数 ---

function Parse-AffinityString {
    param([string]$InputString)
    [uint64]$totalMask = 0
    $tokens = $InputString -replace '[^\d\-,]', ' ' -split ' ' | Where-Object { $_ }
    foreach ($token in $tokens) {
        if ($token -match '^\d+$') { $totalMask = $totalMask -bor (1L -shl ([int]$token)) }
        elseif ($token -match '^(\d+)-(\d+)$') {
            $startCpu, $endCpu = [int]$matches[1], [int]$matches[2]
            if ($startCpu -gt $endCpu) { continue }
            for ($i = $startCpu; $i -le $endCpu; $i++) { $totalMask = $totalMask -bor (1L -shl $i) }
        } else { Write-Warning "已忽略无效的亲和性片段: '$token'" }
    }
    return $totalMask
}

function Parse-WorkingSetString {
    param([string]$InputString)
    if ($InputString -match '^(\d+)-(\d+)$') {
        return @{ Min = [int]$matches[1]; Max = [int]$matches[2] }
    } else {
        return $null
    }
}

function Update-JobBasicLimits {
    param($JobHandle, $CurrentSettings)
    $limitInfo = New-Object NativeMethods+JOBOBJECT_BASIC_LIMIT_INFORMATION
    $limitInfo.LimitFlags = 0
    if ($CurrentSettings.Affinity -ne $null) { $limitInfo.LimitFlags = $limitInfo.LimitFlags -bor [NativeMethods+JOB_OBJECT_LIMIT_FLAGS]::JOB_OBJECT_LIMIT_AFFINITY; $limitInfo.Affinity = New-Object System.UIntPtr($CurrentSettings.Affinity) }
    if ($CurrentSettings.Scheduling -ne $null) { $limitInfo.LimitFlags = $limitInfo.LimitFlags -bor [NativeMethods+JOB_OBJECT_LIMIT_FLAGS]::JOB_OBJECT_LIMIT_SCHEDULING_CLASS; $limitInfo.SchedulingClass = $CurrentSettings.Scheduling }
    if ($CurrentSettings.Priority -ne $null) { $limitInfo.LimitFlags = $limitInfo.LimitFlags -bor [NativeMethods+JOB_OBJECT_LIMIT_FLAGS]::JOB_OBJECT_LIMIT_PRIORITY_CLASS; $limitInfo.PriorityClass = [NativeMethods+PROCESS_PRIORITY_CLASS]::$($CurrentSettings.Priority) }
    if ($CurrentSettings.WorkingSet -ne $null) { $limitInfo.LimitFlags = $limitInfo.LimitFlags -bor [NativeMethods+JOB_OBJECT_LIMIT_FLAGS]::JOB_OBJECT_LIMIT_WORKINGSET; $limitInfo.MinimumWorkingSetSize = New-Object System.UIntPtr([long]$CurrentSettings.WorkingSet.Min * 1MB); $limitInfo.MaximumWorkingSetSize = New-Object System.UIntPtr([long]$CurrentSettings.WorkingSet.Max * 1MB) }
    return [NativeMethods]::SetInformationJobObjectBasic($JobHandle, [NativeMethods+JOBOBJECT_INFO_CLASS]::JobObjectBasicLimitInformation, [ref]$limitInfo, [System.Runtime.InteropServices.Marshal]::SizeOf($limitInfo))
}

function Update-JobNotificationLimits {
    param(
        $JobHandle,
        [switch]$Clear
    )
    $notifyInfo = New-Object NativeMethods+JOBOBJECT_NOTIFICATION_LIMIT_INFORMATION
    if ($Clear) {
        $notifyInfo.LimitFlags = 0
    } else {
        # 将CPU硬上限的容忍度设置为低
        $notifyInfo.LimitFlags = [NativeMethods+JOB_OBJECT_LIMIT_FLAGS]::JOB_OBJECT_LIMIT_RATE_CONTROL
        $notifyInfo.RateControlTolerance = [NativeMethods+JOBOBJECT_RATE_CONTROL_TOLERANCE]::ToleranceLow
        $notifyInfo.RateControlToleranceInterval = [NativeMethods+JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL]::ToleranceIntervalShort
    }

    return [NativeMethods]::SetInformationJobObjectNotification(
        $JobHandle,
        [NativeMethods+JOBOBJECT_INFO_CLASS]::JobObjectNotificationLimitInformation,
        [ref]$notifyInfo,
        [System.Runtime.InteropServices.Marshal]::SizeOf($notifyInfo)
    )
}

function Update-JobCpuLimits {
    param($JobHandle, $CurrentSettings)
    $cpuInfo = New-Object NativeMethods+JOBOBJECT_CPU_RATE_CONTROL_INFORMATION
    $cpuInfo.ControlFlags = 0
    $isHardCapSet = $false

    if ($CurrentSettings.Weight -ne $null) {
        $cpuInfo.ControlFlags = [NativeMethods+JOB_OBJECT_LIMIT_FLAGS]::JOB_OBJECT_CPU_RATE_CONTROL_ENABLE -bor [NativeMethods+JOB_OBJECT_LIMIT_FLAGS]::JOB_OBJECT_CPU_RATE_CONTROL_WEIGHT_BASED
        $cpuInfo.Weight = $CurrentSettings.Weight
    } elseif ($CurrentSettings.CpuLimit -ne $null) {
        $cpuInfo.ControlFlags = [NativeMethods+JOB_OBJECT_LIMIT_FLAGS]::JOB_OBJECT_CPU_RATE_CONTROL_ENABLE -bor [NativeMethods+JOB_OBJECT_LIMIT_FLAGS]::JOB_OBJECT_CPU_RATE_CONTROL_HARD_CAP
        $cpuInfo.CpuRate = $CurrentSettings.CpuLimit * 100
        $isHardCapSet = $true
    }

    $result = [NativeMethods]::SetInformationJobObjectCpuRate($JobHandle, [NativeMethods+JOBOBJECT_INFO_CLASS]::JobObjectCpuRateControlInformation, [ref]$cpuInfo, [System.Runtime.InteropServices.Marshal]::SizeOf($cpuInfo))

    # 如果设置了CPU限制，则相应地更新通知限制（容忍度）
    if ($result) {
        if ($isHardCapSet) {
            # 如果设置了硬上限，则将容忍度设为低
            Update-JobNotificationLimits -JobHandle $JobHandle | Out-Null
        } else {
            # 如果清除了CPU限制或切换到权重模式，则清除容忍度设置
            Update-JobNotificationLimits -JobHandle $JobHandle -Clear | Out-Null
        }
    }

    return $result
}

function Update-JobNetLimits {
    param($JobHandle, $CurrentSettings)
    $netInfo = New-Object NativeMethods+JOBOBJECT_NET_RATE_CONTROL_INFORMATION
    $netInfo.ControlFlags = 0
    if ($CurrentSettings.NetLimit -ne $null) {
        $netInfo.ControlFlags = $netInfo.ControlFlags -bor [NativeMethods+JOB_OBJECT_LIMIT_FLAGS]::JOB_OBJECT_NET_RATE_CONTROL_ENABLE -bor [NativeMethods+JOB_OBJECT_LIMIT_FLAGS]::JOB_OBJECT_NET_RATE_CONTROL_MAX_BANDWIDTH
        $netInfo.MaxBandwidth = [uint64]($CurrentSettings.NetLimit * 1024)
    }
    if ($CurrentSettings.DSCP -ne $null) {
        $netInfo.ControlFlags = $netInfo.ControlFlags -bor [NativeMethods+JOB_OBJECT_LIMIT_FLAGS]::JOB_OBJECT_NET_RATE_CONTROL_ENABLE -bor [NativeMethods+JOB_OBJECT_LIMIT_FLAGS]::JOB_OBJECT_NET_RATE_CONTROL_DSCP_TAG
        $netInfo.DscpTag = $CurrentSettings.DSCP
    }
    return [NativeMethods]::SetInformationJobObjectNetRate($JobHandle, [NativeMethods+JOBOBJECT_INFO_CLASS]::JobObjectNetRateControlInformation, [ref]$netInfo, [System.Runtime.InteropServices.Marshal]::SizeOf($netInfo))
}

function Get-JobStatus {
    param($JobHandle)
    $status = @{ Affinity = "已禁用"; Priority = "已禁用"; Scheduling = "已禁用"; Weight = "已禁用"; CpuLimit = "已禁用"; WorkingSet = "已禁用"; NetLimit = "已禁用"; DSCP = "已禁用" }
    $basicInfo = New-Object NativeMethods+JOBOBJECT_BASIC_LIMIT_INFORMATION
    if ([NativeMethods]::QueryInformationJobObjectBasic($JobHandle, [NativeMethods+JOBOBJECT_INFO_CLASS]::JobObjectBasicLimitInformation, [ref]$basicInfo, [System.Runtime.InteropServices.Marshal]::SizeOf($basicInfo), [ref]0)) {
        if (($basicInfo.LimitFlags -band [NativeMethods+JOB_OBJECT_LIMIT_FLAGS]::JOB_OBJECT_LIMIT_AFFINITY) -ne 0) { $status.Affinity = "0x$($basicInfo.Affinity.ToUInt64().ToString('X'))" }
        if (($basicInfo.LimitFlags -band [NativeMethods+JOB_OBJECT_LIMIT_FLAGS]::JOB_OBJECT_LIMIT_PRIORITY_CLASS) -ne 0) { $status.Priority = ([NativeMethods+PROCESS_PRIORITY_CLASS]$basicInfo.PriorityClass).ToString() }
        if (($basicInfo.LimitFlags -band [NativeMethods+JOB_OBJECT_LIMIT_FLAGS]::JOB_OBJECT_LIMIT_SCHEDULING_CLASS) -ne 0) { $status.Scheduling = $basicInfo.SchedulingClass }
        if (($basicInfo.LimitFlags -band [NativeMethods+JOB_OBJECT_LIMIT_FLAGS]::JOB_OBJECT_LIMIT_WORKINGSET) -ne 0) { $status.WorkingSet = "$($basicInfo.MinimumWorkingSetSize.ToUInt64()/1MB)MB - $($basicInfo.MaximumWorkingSetSize.ToUInt64()/1MB)MB" }
    }
    $cpuInfo = New-Object NativeMethods+JOBOBJECT_CPU_RATE_CONTROL_INFORMATION
    if ([NativeMethods]::QueryInformationJobObjectCpuRate($JobHandle, [NativeMethods+JOBOBJECT_INFO_CLASS]::JobObjectCpuRateControlInformation, [ref]$cpuInfo, [System.Runtime.InteropServices.Marshal]::SizeOf($cpuInfo), [ref]0)) {
        if (($cpuInfo.ControlFlags -band [NativeMethods+JOB_OBJECT_LIMIT_FLAGS]::JOB_OBJECT_CPU_RATE_CONTROL_WEIGHT_BASED) -ne 0) { $status.Weight = $cpuInfo.Weight }
        if (($cpuInfo.ControlFlags -band [NativeMethods+JOB_OBJECT_LIMIT_FLAGS]::JOB_OBJECT_CPU_RATE_CONTROL_HARD_CAP) -ne 0) { $status.CpuLimit = "$($cpuInfo.CpuRate / 100)%" }
    }
    $netInfo = New-Object NativeMethods+JOBOBJECT_NET_RATE_CONTROL_INFORMATION
    if ([NativeMethods]::QueryInformationJobObjectNetRate($JobHandle, [NativeMethods+JOBOBJECT_INFO_CLASS]::JobObjectNetRateControlInformation, [ref]$netInfo, [System.Runtime.InteropServices.Marshal]::SizeOf($netInfo), [ref]0)) {
        if (($netInfo.ControlFlags -band [NativeMethods+JOB_OBJECT_LIMIT_FLAGS]::JOB_OBJECT_NET_RATE_CONTROL_MAX_BANDWIDTH) -ne 0) { $status.NetLimit = "$($netInfo.MaxBandwidth / 1KB) KB/s" }
        if (($netInfo.ControlFlags -band [NativeMethods+JOB_OBJECT_LIMIT_FLAGS]::JOB_OBJECT_NET_RATE_CONTROL_DSCP_TAG) -ne 0) { $status.DSCP = $netInfo.DscpTag }
    }
    return $status
}

function Write-StatusLine {
    param($Label, $Value)
    $labelPadded = $Label.PadRight(30)
    if ($Value -eq "已禁用") {
        Write-Host "${labelPadded}: " -NoNewline
        Write-Host $Value -ForegroundColor Red
    } else {
        Write-Host "${labelPadded}: " -NoNewline
        Write-Host $Value -ForegroundColor Green
    }
}

# --- 步骤 3: 主逻辑 ---

# 模式检测
$isOneShotMode = $PSBoundParameters.Keys.Count -gt 0

# 获取目标进程
$targetProcesses = $null
if ($isOneShotMode) {
    if ($PSBoundParameters.ContainsKey('ProcessName')) { $targetProcesses = Get-Process -Name $ProcessName -ErrorAction SilentlyContinue }
    elseif ($PSBoundParameters.ContainsKey('ProcessId')) { $targetProcesses = Get-Process -Id $ProcessId -ErrorAction SilentlyContinue }
    else { Write-Error "在一次性模式下 必须提供 -ProcessName 或 -ProcessId 参数"; return }
} else {
    while (-not $targetProcesses) {
        $processNameInput = Read-Host -Prompt "请输入目标进程名 (不包含.exe), 或留空以输入进程ID"
        if (-not [string]::IsNullOrWhiteSpace($processNameInput)) {
            $targetProcesses = Get-Process -Name $processNameInput -ErrorAction SilentlyContinue
            $ProcessName = $processNameInput
        } else {
            $processIdInput = Read-Host -Prompt "请输入目标进程ID"
            if (-not [string]::IsNullOrWhiteSpace($processIdInput)) {
                try {
                    $ProcessId = [int]$processIdInput
                    $targetProcesses = Get-Process -Id $ProcessId -ErrorAction SilentlyContinue
                } catch {}
            }
        }
        if (-not $targetProcesses) { Write-Warning "未找到任何目标进程 请重试" }
    }
}

if (-not $targetProcesses) { Write-Host "未找到任何目标进程脚本将退出" -ForegroundColor Yellow; return }

Write-Host "已找到 $($targetProcesses.Count) 个目标进程:" -ForegroundColor Green
$targetProcesses | ForEach-Object { Write-Host "  - $($_.ProcessName) (PID: $($_.Id))" }

$jobId = if ($ProcessName) { "Name_$($ProcessName)" } else { "PID_$($ProcessId)" }
$jobObjectName = "Global\ProcessControllerJob_For_$($jobId)"

$jobHandle = [NativeMethods]::CreateJobObjectW([IntPtr]::Zero, $jobObjectName)
if ($jobHandle -eq [IntPtr]::Zero) { Write-Host "CreateJobObjectW 失败！错误码: $([System.Runtime.InteropServices.Marshal]::GetLastWin32Error())" -F Red; return }
Write-Host "Job Object '$jobObjectName' 已创建/打开" -F Green

foreach ($proc in $targetProcesses) { [NativeMethods]::AssignProcessToJobObject($jobHandle, $proc.Handle) }
Write-Host "已将所有目标进程分配到 Job Object" -F Cyan

# --- 步骤 4: 根据模式执行不同逻辑 ---

if ($isOneShotMode) {
    Write-Host "----------------------------------------------------"
    Write-Host "正在应用一次性设置..." -ForegroundColor Yellow
   
    $settings = @{ Affinity = $null; Priority = $null; Scheduling = $null; Weight = $null; CpuLimit = $null; WorkingSet = $null; NetLimit = $null; DSCP = $null }
    if ($PSBoundParameters.ContainsKey('Affinity')) { $settings.Affinity = Parse-AffinityString -InputString $Affinity }
    if ($PSBoundParameters.ContainsKey('Scheduling')) { $settings.Scheduling = $Scheduling }
    if ($PSBoundParameters.ContainsKey('Priority')) { $settings.Priority = $Priority }
    if ($PSBoundParameters.ContainsKey('Working')) { $settings.WorkingSet = Parse-WorkingSetString -InputString $Working }
    if ($PSBoundParameters.ContainsKey('Weight')) { $settings.Weight = $Weight }
    if ($PSBoundParameters.ContainsKey('CpuLimit')) { $settings.CpuLimit = $CpuLimit }
    if ($PSBoundParameters.ContainsKey('NetLimit')) { $settings.NetLimit = $NetLimit }
    if ($PSBoundParameters.ContainsKey('DSCP')) { $settings.DSCP = $DSCP }
   
    if (Update-JobBasicLimits -JobHandle $jobHandle -CurrentSettings $settings) { Write-Host "成功应用基础限制" -F Green } else { Write-Host "应用基础限制失败" -F Red }
    if (Update-JobCpuLimits -JobHandle $jobHandle -CurrentSettings $settings) { Write-Host "成功应用CPU限制" -F Green } else { Write-Host "应用CPU限制失败" -F Red }
    if (Update-JobNetLimits -JobHandle $jobHandle -CurrentSettings $settings) { Write-Host "成功应用网络限制" -F Green } else { Write-Host "应用网络限制失败" -F Red }
   
    Write-Host "设置已应用 脚本将退出限制将持续有效"
    [NativeMethods]::CloseHandle($jobHandle)
} else {
    try {
        $currentSettings = @{ Affinity = $null; Priority = $null; Scheduling = $null; Weight = $null; CpuLimit = $null; WorkingSet = $null; NetLimit = $null; DSCP = $null }
       
        while ($true) {
            $status = Get-JobStatus -JobHandle $jobHandle
            Clear-Host
            Write-Host "--- 进程控制器菜单 [目标: $($targetProcesses[0].Name)] ---" -ForegroundColor Yellow
            Write-StatusLine -Label "1. 亲和性 (Affinity)" -Value $status.Affinity
            Write-StatusLine -Label "2. 优先级 (Priority)" -Value $status.Priority
            Write-StatusLine -Label "3. 调度优先级 (Scheduling)" -Value $status.Scheduling
            Write-StatusLine -Label "4. 时间片权重 (Weight)" -Value $status.Weight
            Write-StatusLine -Label "5. 数据包优先级 (DSCP)" -Value $status.DSCP
            Write-StatusLine -Label "6. CPU使用率限制 (CpuLimit)" -Value $status.CpuLimit
            Write-StatusLine -Label "7. 传出带宽限制 (NetLimit)" -Value $status.NetLimit
            Write-StatusLine -Label "8. 物理内存限制 (Working)" -Value $status.WorkingSet
            Write-Host "----------------------------------------------------"
            $choice = Read-Host -Prompt "请选择要修改的功能 (1-8), 或输入 'exit' 自动解锁并退出"

            switch ($choice) {
                '1' {
                    $input = Read-Host "请输入新的亲和性 (例如: 8 10 12-15)"
                    $mask = Parse-AffinityString -InputString $input
                    if ($mask -gt 0) { $currentSettings.Affinity = $mask } else { Write-Warning "无效输入" }
                }
                '2' {
                    $input = Read-Host "请输入新的优先级 (Idle, BelowNormal, Normal, AboveNormal, High, RealTime)"
                    if ([System.Enum]::IsDefined([NativeMethods+PROCESS_PRIORITY_CLASS], $input)) { $currentSettings.Priority = $input } else { Write-Warning "无效输入" }
                }
                '3' {
                    $input = Read-Host "请输入新的调度优先级 (0-9)"
                    if ($input -match '^[0-9]$') { $currentSettings.Scheduling = [int]$input } else { Write-Warning "无效输入" }
                }
                '4' {
                    $input = Read-Host "请输入新的时间片权重 (1-9)"
                    if ($input -match '^[1-9]$') { $currentSettings.Weight = [int]$input; $currentSettings.CpuLimit = $null } else { Write-Warning "无效输入" }
                }
                '5' {
                    $input = Read-Host "请输入新的数据包优先级 (0-63)"
                    if ($input -match '^\d+$' -and [int]$input -ge 0 -and [int]$input -le 63) { $currentSettings.DSCP = [int]$input } else { Write-Warning "无效输入" }
                }
                '6' {
                    $input = Read-Host "请输入新的CPU使用率上限 (1-100)"
                    if ($input -match '^\d+$' -and [int]$input -ge 1 -and [int]$input -le 100) { $currentSettings.CpuLimit = [int]$input; $currentSettings.Weight = $null } else { Write-Warning "无效输入" }
                }
                '7' {
                    $input = Read-Host "请输入新的传出带宽上限 (KB/s)"
                    if ($input -match '^\d+$' -and [int]$input -gt 0) { $currentSettings.NetLimit = [int]$input } else { Write-Warning "无效输入" }
                }
                '8' {
                    $input = Read-Host "请输入新的物理内存上限 (格式: 最小MB-最大MB, 例如 256-1024)"
                    $ws = Parse-WorkingSetString -InputString $input
                    if ($ws) { $currentSettings.WorkingSet = $ws } else { Write-Warning "无效输入" }
                }
                'exit' {
                    break
                }
                default {
                    Write-Warning "无效的选择 请输入 1-8 或 exit"
                    Start-Sleep -Seconds 2
                }
            }
            # 每次修改后 都用包含所有当前设置的 $currentSettings 对象去原子化地更新
            Update-JobBasicLimits -JobHandle $jobHandle -CurrentSettings $currentSettings | Out-Null
            Update-JobCpuLimits -JobHandle $jobHandle -CurrentSettings $currentSettings | Out-Null
            Update-JobNetLimits -JobHandle $jobHandle -CurrentSettings $currentSettings | Out-Null
        }
    }
    finally {
        Write-Host "`n正在退出... 自动移除所有限制..." -ForegroundColor Yellow
        if ($jobHandle -and $jobHandle -ne [IntPtr]::Zero) {
            $emptySettings = @{ Affinity = $null; Priority = $null; Scheduling = $null; Weight = $null; CpuLimit = $null; WorkingSet = $null; NetLimit = $null; DSCP = $null }
            Update-JobBasicLimits -JobHandle $jobHandle -CurrentSettings $emptySettings | Out-Null
            Update-JobCpuLimits -JobHandle $jobHandle -CurrentSettings $emptySettings | Out-Null
            Update-JobNetLimits -JobHandle $jobHandle -CurrentSettings $emptySettings | Out-Null
           
            Write-Host "解锁成功！" -ForegroundColor Green
            [NativeMethods]::CloseHandle($jobHandle)
        }
        Write-Host "控制器已终止"
    }
}
