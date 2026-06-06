# ============================================================
# Codex of Azeroth :: Build Release ZIP
# ============================================================
# Crea un ZIP listo para subir a CurseForge / WoWInterface / GitHub
# Releases. El ZIP contiene SOLO los archivos necesarios para que
# el addon funcione (toc + Core/ + Data/ + Locale/ + UI/ + README
# + LICENSE + CHANGELOG), excluyendo .git/, .github/, .gitignore,
# .gitattributes, scripts de build, etc.
#
# Uso:
#   .\build-release.ps1                # usa la versión del .toc
#   .\build-release.ps1 -Version 0.2.0  # fuerza una versión concreta
# ============================================================

param(
    [string]$Version = "",
    [string]$OutputDir = "releases"
)

$ErrorActionPreference = "Stop"

# Ir al directorio del script
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $ScriptDir

# --- Detectar versión automáticamente desde el .toc si no se pasa ---
$tocPath = "CodexOfAzeroth.toc"
if (-not (Test-Path $tocPath)) {
    Write-Host "[ERROR] No se encuentra $tocPath" -ForegroundColor Red
    exit 1
}

if ([string]::IsNullOrWhiteSpace($Version)) {
    $tocContent = Get-Content $tocPath -Raw
    if ($tocContent -match '(?m)^##\s*Version:\s*(\S+)') {
        $Version = $Matches[1]
    } else {
        Write-Host "[ERROR] No se encontró ## Version: en el .toc" -ForegroundColor Red
        exit 1
    }
}

Write-Host "[INFO] Versión detectada: $Version" -ForegroundColor Cyan

# --- Crear directorio temporal para el staging ---
$stagingName = "CodexOfAzeroth"
$stagingPath = Join-Path $env:TEMP $stagingName

if (Test-Path $stagingPath) {
    Remove-Item -Recurse -Force $stagingPath
}
New-Item -ItemType Directory -Path $stagingPath | Out-Null

# --- Archivos y carpetas a incluir ---
$includePaths = @(
    "CodexOfAzeroth.toc"
    "Core"
    "Data"
    "Locale"
    "UI"
    "README.md"
    "LICENSE"
    "CHANGELOG.md"
)

foreach ($rel in $includePaths) {
    $src = Join-Path $ScriptDir $rel
    $dst = Join-Path $stagingPath $rel
    if (-not (Test-Path $src)) {
        Write-Host "[WARN] No existe: $rel (se omite)" -ForegroundColor Yellow
        continue
    }
    Copy-Item -Path $src -Destination $dst -Recurse -Force
    Write-Host "[OK]    + $rel" -ForegroundColor Green
}

# --- Crear el ZIP ---
if (-not (Test-Path $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir | Out-Null
}
$zipName = "CodexOfAzeroth-v$Version.zip"
$zipPath = Join-Path $OutputDir $zipName

if (Test-Path $zipPath) {
    Remove-Item $zipPath -Force
}

# Zip la carpeta CodexOfAzeroth/ entera para que al extraer en AddOns/
# quede directamete: Interface/AddOns/CodexOfAzeroth/CodexOfAzeroth.toc
Compress-Archive -Path "$stagingPath" -DestinationPath $zipPath -CompressionLevel Optimal

# --- Limpieza ---
Remove-Item -Recurse -Force $stagingPath

# --- Resumen ---
$zipFull = Resolve-Path $zipPath
$size = (Get-Item $zipFull).Length
Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host " Release ZIP creado correctamente" -ForegroundColor Green
Write-Host "   Ruta : $zipFull" -ForegroundColor White
Write-Host "   Tamaño: $([math]::Round($size/1KB, 1)) KB" -ForegroundColor White
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Próximos pasos:" -ForegroundColor Yellow
Write-Host "  1. Sube el ZIP a GitHub Releases como v$Version" -ForegroundColor White
Write-Host "  2. Sube el mismo ZIP a CurseForge (Project → Upload File)" -ForegroundColor White
Write-Host "  3. Anuncia en WoWInterface, Reddit, Discord de la comunidad, etc." -ForegroundColor White