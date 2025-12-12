# Requires -RunAsAdministrator

Write-Host "Iniciando script de configuración de entorno de desarrollo..." -ForegroundColor Cyan

# --- 1. Verificar e Instalar Chocolatey (Gestor de Paquetes) ---
Write-Host "Verificando instalación de Chocolatey..." -ForegroundColor Blue

if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Chocolatey no encontrado. Instalando Chocolatey..." -ForegroundColor Yellow
    # Comando de instalación oficial de Chocolatey
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('community.chocolatey.org'))
    
    if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
        Write-Error "Fallo la instalacion de Chocolatey. Saliendo del script."
        exit 1
    }
    Write-Host "Chocolatey instalado correctamente." -ForegroundColor Green
} else {
    Write-Host "Chocolatey ya esta instalado." -ForegroundColor Green
}

# --- 2. Instalar los programas solicitados usando Chocolatey ---

# Lista de paquetes a instalar. Estos son los nombres oficiales en la comunidad Chocolatey.
$packages = @(
    "postman"
    "vscode"
    "python"
    "newman" # Nota: Newman se instala como un paquete npm global
    "docker-desktop"
    "jenkins"
    "jmeter"
)

Write-Host "Iniciando instalacion de programas..." -ForegroundColor Blue

foreach ($package in $packages) {
    Write-Host "Instalando $package..." -ForegroundColor Cyan
    # -y acepta automáticamente todos los prompts de instalación
    choco install $package -y
    if ($LASTEXITCODE -eq 0) {
        Write-Host "$package instalado correctamente." -ForegroundColor Green
    } else {
        Write-Error "Hubo un error instalando $package. Revisa los logs."
    }
}

# --- 3. Manejar NPM y Newman (requieren Python/Node.js instalado primero) ---

Write-Host "Verificando e instalando NPM y Newman..." -ForegroundColor Blue

# NPM generalmente viene incluido con Node.js/Python si se instalaron con choco, pero verificamos.

# Newman se instala globalmente via npm
# Requerimos que Python ya esté en el PATH para que npm funcione correctamente a veces.
if (Get-Command npm -ErrorAction SilentlyContinue) {
    npm install -g newman
    Write-Host "Newman instalado globalmente via npm." -ForegroundColor Green
} else {
    Write-Error "NPM no se encontro. No se pudo instalar Newman."
}


Write-Host "Proceso de instalacion completado." -ForegroundColor Cyan
Write-Host "Es posible que necesites reiniciar tu terminal o computadora para que todos los cambios surtan efecto (especialmente Docker)." -ForegroundColor Yellow
