# Define the task name
$taskName = "RunPontoScript"

# Resolve full path to ponto.ps1 using PATH environment
$pontoPath = (Get-Command ponto.ps1).Source

# Define the action to run the script using PowerShell 7
$action = New-ScheduledTaskAction -Execute "pwsh.exe" -Argument "-NoProfile -ExecutionPolicy Bypass -File `"$pontoPath`""

# Create individual triggers for each time
$trigger1 = New-ScheduledTaskTrigger -Daily -At (Get-Date "09:00AM")
$trigger2 = New-ScheduledTaskTrigger -Daily -At (Get-Date "11:59AM")
$trigger3 = New-ScheduledTaskTrigger -Daily -At (Get-Date "01:00PM")
$trigger4 = New-ScheduledTaskTrigger -Daily -At (Get-Date "06:00PM")

# Combine triggers into an array
$triggers = @($trigger1, $trigger2, $trigger3, $trigger4)

# Define the principal (run under current user without elevated privileges)
$principal = New-ScheduledTaskPrincipal -UserId "$env:USERNAME" -LogonType Interactive

# Register the scheduled task
Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $triggers -Principal $principal -Force

Write-Host "Scheduled task '$taskName' created successfully."