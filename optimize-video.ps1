# Optimizador de Video - Cantina Bernardo
# Requiere: FFmpeg instalado y en el PATH

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Optimizador de Video - Cantina Bernardo" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Verificar si ffmpeg está instalado
if (-not (Get-Command "ffmpeg" -ErrorAction SilentlyContinue)) {
    Write-Host "ERROR: FFmpeg no esta instalado o no esta en el PATH" -ForegroundColor Red
    Write-Host ""
    Write-Host "Para instalarlo:" -ForegroundColor Yellow
    Write-Host "  1. Descargar de: https://ffmpeg.org/download.html"
    Write-Host "  2. O con Chocolatey: choco install ffmpeg"
    Write-Host "  3. O con Scoop: scoop install ffmpeg"
    Write-Host ""
    Write-Host "Despues de instalar, reinicia tu terminal y ejecuta este script de nuevo"
    Write-Host ""
    pause
    exit 1
}

Write-Host "FFmpeg encontrado!" -ForegroundColor Green
Write-Host ""

# Variables
$INPUT = "assets\images\hero-video.mp4"
$OUTPUT_MP4 = "assets\images\hero-video-optimized.mp4"
$OUTPUT_WEBM = "assets\images\hero-video.webm"

# Verificar si el archivo de entrada existe
if (-not (Test-Path $INPUT)) {
    Write-Host "ERROR: No se encuentra el video en $INPUT" -ForegroundColor Red
    pause
    exit 1
}

$origSize = (Get-Item $INPUT).Length
Write-Host "Video original: $origSize bytes ($([math]::Round($origSize / 1MB, 2)) MB)"
Write-Host ""

# Optimize MP4
Write-Host "[1/2] Creando version MP4 optimizada..." -ForegroundColor Yellow
Write-Host "Esto puede tomar 1-2 minutos..." -ForegroundColor Gray
Write-Host ""

ffmpeg -i $INPUT -vcodec libx264 -crf 23 -preset slow -vf "scale=1920:-2" -movflags +faststart -an $OUTPUT_MP4 -y

if ($LASTEXITCODE -eq 0) {
    $optSize = (Get-Item $OUTPUT_MP4).Length
    $reduction = [math]::Round((($origSize - $optSize) / $origSize) * 100, 1)
    Write-Host ""
    Write-Host "OK - MP4 optimizado: $([math]::Round($optSize / 1MB, 2)) MB" -ForegroundColor Green
    Write-Host "Reduccion: $reduction%" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "ERROR al crear MP4 optimizado" -ForegroundColor Red
    pause
    exit 1
}

# Optimize WebM
Write-Host ""
Write-Host "[2/2] Creando version WebM..." -ForegroundColor Yellow
Write-Host "Esto puede tomar 2-3 minutos..." -ForegroundColor Gray
Write-Host ""

ffmpeg -i $INPUT -c:v libvpx-vp9 -crf 30 -b:v 0 -vf "scale=1920:-2" -an $OUTPUT_WEBM -y

if ($LASTEXITCODE -eq 0) {
    $webmSize = (Get-Item $OUTPUT_WEBM).Length
    $webmReduction = [math]::Round((($origSize - $webmSize) / $origSize) * 100, 1)
    Write-Host ""
    Write-Host "OK - WebM: $([math]::Round($webmSize / 1MB, 2)) MB" -ForegroundColor Green
    Write-Host "Reduccion: $webmReduction%" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "ERROR al crear WebM" -ForegroundColor Red
    pause
    exit 1
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  Optimizacion completada!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Siguiente paso: Editar index.html para usar los nuevos videos:" -ForegroundColor Yellow
Write-Host ""
Write-Host "<video autoplay loop muted playsinline>"
Write-Host "    <source src='assets/images/hero-video.webm' type='video/webm'>"
Write-Host "    <source src='assets/images/hero-video-optimized.mp4' type='video/mp4'>"
Write-Host "</video>"
Write-Host ""

# Pausar para que el usuario pueda ver los resultados
Write-Host "Presiona Enter para continuar..."
Read-Host | Out-Null
