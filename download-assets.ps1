# Script para descargar assets de Cantina Bernardo
# Ejecutar: powershell -ExecutionPolicy Bypass -File download-assets.ps1

$ErrorActionPreference = "Continue"

Write-Host "Descargando assets de Cantina Bernardo..." -ForegroundColor Cyan

# URLs de los assets
$assets = @{
    "logo.png" = "https://storage.readdy-site.link/project_files/d1b8db77-edbb-4ea5-84e2-18e8f9f7263b/dd5538db-d0ab-4b37-be5a-c413dc61caab_cantina-bernardo.png"
    "hero-video.mp4" = "https://storage.readdy-site.link/project_files/d1b8db77-edbb-4ea5-84e2-18e8f9f7263b/b4d59ed0-aa97-48cc-af5e-49ba5c2c35d7_0613.mp4"
    "menu-hero.jpg" = "https://readdy.ai/api/search-image?query=Rustic%20Italian%20antipasto%20platter%20with%20cured%20ham%2C%20salami%2C%20tandil%20cheese%2C%20olives%2C%20grilled%20vegetables%20on%20wooden%20board%2C%20warm%20candle%20lighting%2C%20dark%20moody%20restaurant%20atmosphere%2C%20shallow%20depth%20of%20field%2C%20editorial%20food%20photography%2C%20rich%20amber%20tones%2C%20dark%20background%2C%20minimal%20styling&width=800&height=600&seq=menu-cat-01-img&orientation=landscape"
    "avatar-1.jpg" = "https://readdy.ai/api/search-image?query=Warm%20sepia%20toned%20portrait%20of%20a%20man%20in%20his%20thirties%2C%20friendly%20expression%2C%20soft%20lighting%2C%20vintage%20Italian%20cantina%20aesthetic%2C%20dark%20background%2C%20simple%20headshot%2C%20natural%20style&width=200&height=200&seq=review-01-avatar&orientation=squarish"
    "avatar-2.jpg" = "https://readdy.ai/api/search-image?query=Warm%20sepia%20toned%20portrait%20of%20a%20woman%20in%20her%20late%20twenties%2C%20smiling%20naturally%2C%20soft%20lighting%2C%20vintage%20Italian%20vibe%2C%20dark%20muted%20background%2C%20simple%20casual%20headshot&width=200&height=200&seq=review-02-avatar&orientation=squarish"
    "avatar-3.jpg" = "https://readdy.ai/api/search-image?query=Warm%20sepia%20toned%20portrait%20of%20a%20couple%20hugging%20happily%2C%20soft%20romantic%20lighting%2C%20vintage%20Italian%20cantina%20aesthetic%2C%20dark%20background%2C%20candid%20style%2C%20simple%20warm%20tones&width=200&height=200&seq=review-03-avatar&orientation=squarish"
    "avatar-4.jpg" = "https://readdy.ai/api/search-image?query=Warm%20sepia%20toned%20portrait%20of%20a%20woman%20in%20her%20thirties%2C%20thoughtful%20gentle%20smile%2C%20soft%20lighting%2C%20vintage%20Italian%20aesthetic%2C%20dark%20background%2C%20simple%20elegant%20headshot&width=200&height=200&seq=review-04-avatar&orientation=squarish"
    "avatar-5.jpg" = "https://readdy.ai/api/search-image?query=Warm%20sepia%20toned%20portrait%20of%20a%20man%20in%20his%20late%20twenties%2C%20confident%20friendly%20grin%2C%20soft%20lighting%2C%20vintage%20rustic%20aesthetic%2C%20dark%20background%2C%20simple%20casual%20headshot&width=200&height=200&seq=review-05-avatar&orientation=squarish"
    "avatar-6.jpg" = "https://readdy.ai/api/search-image?query=Warm%20sepia%20toned%20portrait%20of%20a%20young%20couple%20smiling%20joyfully%2C%20soft%20golden%20lighting%2C%20vintage%20Italian%20cantina%20mood%2C%20dark%20muted%20background%2C%20candid%20natural%20style&width=200&height=200&seq=review-06-avatar&orientation=squarish"
}

# Crear carpeta si no existe
$imagesPath = "assets\images"
if (-not (Test-Path $imagesPath)) {
    New-Item -ItemType Directory -Path $imagesPath -Force | Out-Null
}

# Descargar cada asset
$count = 0
$total = $assets.Count

foreach ($file in $assets.GetEnumerator()) {
    $count++
    $filename = $file.Key
    $url = $file.Value
    $outputPath = Join-Path $imagesPath $filename
    
    Write-Host "[$count/$total] Descargando $filename..." -ForegroundColor Yellow
    
    try {
        # Usar Invoke-WebRequest con parámetros optimizados
        Invoke-WebRequest -Uri $url -OutFile $outputPath -UseBasicParsing -TimeoutSec 60
        
        $fileSize = (Get-Item $outputPath).Length / 1KB
        $fileSizeRounded = [math]::Round($fileSize, 2)
        Write-Host "  OK - Completado ($fileSizeRounded KB)" -ForegroundColor Green
    }
    catch {
        Write-Host "  ERROR: $_" -ForegroundColor Red
        Write-Host "  Puedes descargar manualmente desde: $url" -ForegroundColor Yellow
    }
    
    Start-Sleep -Milliseconds 500
}

Write-Host "`n✨ Proceso completado!" -ForegroundColor Cyan
Write-Host "Verifica los archivos en: $imagesPath" -ForegroundColor White
Write-Host "`nSi algunos archivos no se descargaron, puedes:" -ForegroundColor Yellow
Write-Host "1. Ejecutar el script nuevamente" -ForegroundColor White
Write-Host "2. Descargarlos manualmente desde las URLs en el script" -ForegroundColor White
Write-Host "3. Usar imágenes propias del restaurante" -ForegroundColor White

# Listar archivos descargados
Write-Host "`nArchivos en assets/images:" -ForegroundColor Cyan
Get-ChildItem -Path $imagesPath | ForEach-Object {
    $sizeKB = [math]::Round($_.Length / 1KB, 2)
    Write-Host "  - $($_.Name) ($sizeKB KB)" -ForegroundColor Gray
}
