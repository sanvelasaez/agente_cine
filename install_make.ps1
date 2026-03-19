# Script para instalar GNU make via Chocolatey
# Ejecutar como Administrador: Right-click -> "Ejecutar con PowerShell"

Write-Host "Instalando GNU make via Chocolatey..." -ForegroundColor Green

# Verificar si Chocolatey ya está instalado
if (!(Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Instalando Chocolatey primero..." -ForegroundColor Yellow
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

    # Refrescar variables de entorno
    $env:ChocolateyInstall = Convert-Path "$((Get-Command choco).Path)\..\.."
    Import-Module "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
    refreshenv
}

# Instalar make
Write-Host "Instalando make..." -ForegroundColor Yellow
choco install make -y

Write-Host ""
Write-Host "Instalacion completada!" -ForegroundColor Green
Write-Host "Cierra y vuelve a abrir tu terminal para usar el comando 'make'" -ForegroundColor Cyan
Write-Host ""
Write-Host "Presiona cualquier tecla para salir..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
