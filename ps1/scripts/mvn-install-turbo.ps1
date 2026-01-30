<#
.SYNOPSIS
    Executa o Maven no modo turbo, silencioso e com log único.
.DESCRIPTION
    Roda `mvn -o clean install` com flags de performance e redireciona toda a saída
    para um arquivo de log. Usa `cmd.exe /c` para suportar `> log 2>&1` corretamente.
.EXAMPLE
    PS> ./mvn-install-turbo.ps1
.NOTES
    Author: Copilot
#>

# 1) Gera nome de log rotativo
$timestamp = (Get-Date).ToString("yyyy-MM-dd_HH-mm-ss")
$logFile   = "build_$timestamp.log"

# 2) Flags turbo do Maven
$mvnArgs = @(
    "-o",                      # offline: sem rede
    "-q",                      # quiet: menos I/O
    "-T", "1C",                # paralelo: 1 thread por core
    "--no-transfer-progress",  # sem barra de progresso
    "-Dstyle.color=never",     # sem ANSI
    "-DskipTests",             # sem testes
    "clean", "install"
)

# 3) Constrói a linha única para o CMD, com redirecionamento > log 2>&1
#    Observação: aspas no caminho do log para suportar espaços
$joinedArgs = ($mvnArgs -join ' ')
$cmdLine    = "mvn $joinedArgs >> `"$logFile`" 2>>&1"

# 4) Executa em background, janela oculta, e aguarda terminar
$proc = Start-Process -FilePath "cmd.exe" `
    -ArgumentList "/c", $cmdLine `
    -WindowStyle Hidden `
    -PassThru

Write-Host "Build iniciado em background. PID: $($proc.Id)"
$proc.WaitForExit()

if ($proc.ExitCode -eq 0) {
    Write-Host "✔ Build finalizado com sucesso." -ForegroundColor Green
} else {
    Write-Host "❌ Build finalizado com erro (ExitCode=$($proc.ExitCode))." -ForegroundColor Red
}

Write-Host "Log: $logFile"
