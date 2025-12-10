Param(
    [Parameter(Mandatory=$true)]
    [string]$Url,

    [string]$OutputFile = "output.mp4",

    [string]$Start = "00:00:00",

    [string]$End = "00:01:18"
)

Write-Host "=== Atualizando yt-dlp ==="
yt-dlp -U

Write-Host "`n=== Listando formatos disponíveis ==="
yt-dlp -F $Url

Write-Host "`n=== Baixando melhor vídeo+áudio disponível (qualquer formato) ==="
yt-dlp -f "bv*+ba/best" $Url -o "temp.%(ext)s"

# Descobrir o arquivo baixado
$tempFile = Get-ChildItem -Filter "temp.*" | Select-Object -First 1

if (-not $tempFile) {
    Write-Host "ERRO: Nenhum arquivo baixado!" -ForegroundColor Red
    exit
}

Write-Host "`n=== Arquivo baixado: $($tempFile.Name) ==="

Write-Host "`n=== Cortando vídeo com FFmpeg ==="
$cutFile = "temp_cut.$($tempFile.Extension)"

ffmpeg -ss $Start -to $End -i $tempFile.FullName -c copy $cutFile -y

Write-Host "`n=== Convertendo para MP4 (libx264 + AAC) ==="
ffmpeg -i $cutFile -c:v libx264 -c:a aac $OutputFile -y

Write-Host "`n=== Limpando arquivos temporários ==="
Remove-Item temp.* -Force

Write-Host "`n=== Processo concluído! ==="
Write-Host "Arquivo final: $OutputFile"
