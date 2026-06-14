@echo off
echo ==========================================
echo   Optimizador de Video - Cantina Bernardo
echo ==========================================
echo.

REM Verificar si ffmpeg está instalado
where ffmpeg >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: FFmpeg no esta instalado
    echo.
    echo Para instalarlo:
    echo 1. Descargar de: https://ffmpeg.org/download.html
    echo 2. O instalar con Chocolatey: choco install ffmpeg
    echo 3. O instalar con Scoop: scoop install ffmpeg
    echo.
    pause
    exit /b 1
)

echo FFmpeg encontrado!
echo.

set INPUT=assets\images\hero-video.mp4
set OUTPUT_MP4=assets\images\hero-video-optimized.mp4
set OUTPUT_WEBM=assets\images\hero-video.webm

if not exist "%INPUT%" (
    echo ERROR: No se encuentra el video en %INPUT%
    pause
    exit /b 1
)

echo Optimizando video...
echo.
echo [1/2] Creando version MP4 optimizada...
echo Esto puede tomar 1-2 minutos...
echo.

ffmpeg -i "%INPUT%" -vcodec libx264 -crf 23 -preset slow -vf "scale=1920:-2" -movflags +faststart -an "%OUTPUT_MP4%" -y

if %ERRORLEVEL% EQU 0 (
    echo OK - MP4 optimizado creado
    for %%A in ("%INPUT%") do set ORIG_SIZE=%%~zA
    for %%A in ("%OUTPUT_MP4%") do set OPT_SIZE=%%~zA
    echo Tamaño original: %ORIG_SIZE% bytes
    echo Tamaño optimizado: %OPT_SIZE% bytes
    echo.
) else (
    echo ERROR al crear MP4 optimizado
    pause
    exit /b 1
)

echo [2/2] Creando version WebM...
echo Esto puede tomar 2-3 minutos...
echo.

ffmpeg -i "%INPUT%" -c:v libvpx-vp9 -crf 30 -b:v 0 -vf "scale=1920:-2" -an "%OUTPUT_WEBM%" -y

if %ERRORLEVEL% EQU 0 (
    echo OK - WebM creado
    for %%A in ("%OUTPUT_WEBM%") do set WEBM_SIZE=%%~zA
    echo Tamaño WebM: %WEBM_SIZE% bytes
    echo.
) else (
    echo ERROR al crear WebM
    pause
    exit /b 1
)

echo ==========================================
echo   Optimizacion completada!
echo ==========================================
echo.
echo Proximos pasos:
echo 1. Actualizar index.html para usar los videos optimizados
echo 2. Probar en el navegador
echo 3. Si funciona, eliminar el video original
echo.
echo Codigo HTML sugerido:
echo ^<video autoplay loop muted playsinline^>
echo     ^<source src="assets/images/hero-video.webm" type="video/webm"^>
echo     ^<source src="assets/images/hero-video-optimized.mp4" type="video/mp4"^>
echo ^</video^>
echo.
pause
