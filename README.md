# Install-DevTools.ps1
Instala los programas necesarios para automatizar y realizar pruebas

Sigue estos 3 sencillos pasos para configurar tu entorno:
Paso 1: Abrir PowerShell como Administrador
Busca "PowerShell" en el menú de inicio, haz clic derecho en Windows PowerShell y selecciona "Ejecutar como administrador".
Paso 2: Clonar el Repositorio
En la ventana de PowerShell que se abrió, ejecuta los siguientes comandos para descargar este repositorio (reemplaza tu-usuario/tu-repositorio por los datos reales de tu cuenta de GitHub):
powershell
git clone github.com
cd tu-repositorio
Usa el código con precaución.

Paso 3: Ejecutar el Script de Instalación
Una vez dentro del directorio del repositorio, ejecuta el script principal:
powershell
.\Install-DevTools.ps1
Usa el código con precaución.

Permisos de Ejecución: Si Windows te bloquea con un error sobre políticas de ejecución, ejecuta este comando una sola vez antes de ejecutar el script principal, y luego repite el Paso 3:
powershell
Set-ExecutionPolicy RemoteSigned -Scope Process -Force
