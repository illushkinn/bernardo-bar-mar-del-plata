# Script para optimizar el video hero
# Requiere FFmpeg instalado: https://ffmpeg.org/download.html

$inputVideo = "assets\images\hero-video.mp4"
$outputVideo = "assets\images\hero-video-optimized.mp4"
$outputWebm = "assets\images\hero-video.webm"

Write-Host "Optimizando video para web..." -ForegroundColor Cyan

# Verificar si FFmpeg está instalado
try {
    $ffmpegVersion = ffmpeg -version 2>&1
    Write-Host "FFmpeg encontrado!" -ForegroundColor Green
}
catch {
    Write-Host "ERROR: FFmpeg no está instalado o no está en el PATH" -ForegroundColor Red
    Write-Host "`nPara instalar FFmpeg:" -ForegroundColor Yellow
    Write-Host "1. Descargar de: https://ffmpeg.org/download.html" -ForegroundColor White
    Write-Host "2. O usar Chocolatey: choco install ffmpeg" -ForegroundColor White
    Write-Host "3. O usar Scoop: scoop install ffmpeg" -ForegroundColor White
    exit 1
}

Write-Host "`n[1/2] Creando versión MP4 optimizada (mejor calidad/tamaño)..." -ForegroundColor Yellow
Write-Host "Esto puede tomar 1-2 minutos..." -ForegroundColor Gray

# MP4 optimizado con H.264 - balance calidad/peso
ffmpeg -i $inputVideo `
    -vcodec libx264 `
    -crf 23 `
    -preset slow `
    -vf "scale=1920:-2" `
    -movflags +faststart `
    -an `
    $outputVideo -y

if (Test-Path $outputVideo) {
    $originalSize = (Get-Item $inputVideo).Length / 1MB
    $optimizedSize = (Get-Item $outputVideo).Length / 1MB
    $reduction = [math]::Round((($originalSize - $optimizedSize) / $originalSize) * 100, 1)
    
    Write-Host "  OK - MP4 optimizado creado" -ForegroundColor Green
    Write-Host "  Original: $([math]::Round($originalSize, 2)) MB" -ForegroundColor Gray
    Write-Host "  Optimizado: $([math]::Round($optimizedSize, 2)) MB" -ForegroundColor Gray
    Write-Host "  Reducción: $reduction%" -ForegroundColor Cyan
}

Write-Host "`n[2/2] Creando versión WebM (máxima compresión)..." -ForegroundColor Yellow
Write-Host "Esto puede tomar 2-3 minutos..." -ForegroundColor Gray

# WebM con VP9 - mejor compresión para web moderna
ffmpeg -i $inputVideo `
    -c:v libvpx-vp9 `
    -crf 30 `
    -b:v 0 `
    -vf "scale=1920:-2" `
    -an `
    $outputWebm -y

if (Test-Path $outputWebm) {
    $webmSize = (Get-Item $outputWebm).Length / 1MB
    $reduction = [math]::Round((($originalSize - $webmSize) / $originalSize) * 100, 1)
    
    Write-Host "  OK - WebM creado" -ForegroundColor Green
    Write-Host "  Tamaño: $([math]::Round($webmSize, 2)) MB" -ForegroundColor Gray
    Write-Host "  Reducción: $reduction%" -ForegroundColor Cyan
}

Write-Host "`nOptimización completada!" -ForegroundColor Green
Write-Host "`nPróximos pasos:" -ForegroundColor Yellow
Write-Host "1. Actualizar index.html para usar los videos optimizados" -ForegroundColor White
Write-Host "2. Probar en el navegador" -ForegroundColor White
Write-Host "3. Si todo funciona, eliminar el video original" -ForegroundColor White

Write-Host "`nCódigo HTML sugerido:" -ForegroundColor Cyan
Write-Host @"
<video autoplay loop muted playsinline>
    <source src="assets/images/hero-video.webm" type="video/webm">
    <source src="assets/images/hero-video-optimized.mp4" type="video/mp4">
</video>
"@ -ForegroundColor Gray
