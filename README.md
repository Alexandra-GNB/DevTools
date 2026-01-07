# Install-DevTools.ps1
# 📘 Guía de Instalación y Ejecución de Pruebas Automatizadas

Este documento describe paso a paso cómo configurar el entorno y ejecutar pruebas automatizadas utilizando **PowerShell**, **Newman (Postman)** y **TestSprite**.

---

## 🧰 Requisitos Previos

Antes de comenzar, asegúrate de tener instalado:

* **Windows**
* **Git**
* **Node.js (incluye npm)**
* **PowerShell**

---

## ⚙️ Configuración del Entorno

### Paso 1: Abrir PowerShell como Administrador

1. Busca **PowerShell** en el menú de inicio.
2. Haz clic derecho sobre **Windows PowerShell**.
3. Selecciona **Ejecutar como administrador**.

---

### Paso 2: Clonar el Repositorio

En la ventana de PowerShell, ejecuta los siguientes comandos (reemplaza los valores con los reales):

```powershell
git clone https://github.com/tu-usuario/tu-repositorio.git
cd tu-repositorio
```

---

### Paso 3: Ejecutar el Script de Instalación

Una vez dentro del directorio del repositorio, ejecuta:

```powershell
.\Install-DevTools.ps1
```

#### ⚠️ Permisos de Ejecución

Si Windows bloquea la ejecución por políticas de seguridad, ejecuta **una sola vez**:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope Process -Force
```

Luego, vuelve a ejecutar el script de instalación.

---

## 📦 Instalación y Uso de Newman

### Instalar Newman (si no está instalado)

```powershell
npm install -g newman
```

---

### Ejecutar una Collection Básica con Environment

```powershell
newman run tu-collection.json -e tu-environment.json
```

---

### Ver Resultados Detallados (CLI + HTML)

```powershell
newman run tu-collection.json -r cli,html
```

---

## ▶️ Uso del Script `newman.ps1`

### Ejecución Básica desde PowerShell

```powershell
.\newman.ps1 -Collection "nombre.postman_collection.json" -e "nombre.postman_environment.json"
```

---

### Prueba de Carga (Iteraciones Secuenciales)

```powershell
.\newman.ps1 -Collection "nombre.postman_collection.json" -e "nombre.postman_environment.json" -Iterations 10 -DelaySeconds 2
```

---

### Prueba de Carga Real (Ejecución en Paralelo – Usuarios Concurrentes)

```powershell
.\newman.ps1 -Collection "collection.json" -e "environment" -Iterations 50 -Parallel
```

---

### Prueba Intensa

```powershell
.\newman.ps1 -Iterations 100 -DelaySeconds 0 -Parallel
```

---

### Preparación para Ejecutar `newman.ps1`

1. Navega a la ruta donde se encuentra el script:

```powershell
cd "C:\ruta\donde\guardaste\el\script"
```

2. Otorga permisos de ejecución (solo para la sesión actual):

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

---

### Ejemplo – Prueba de Carga

```powershell
.\newman.ps1 -Collection "nombre-api.postman_collection.json" -Environment "env.postman_environment.json" -Iterations 5 -Parallel
```

---

## 🧪 Uso de TestSprite

> **Nota importante:**
>
> * TestSprite utiliza una **API Key** que se asigna al descargar el framework.
> * Asegúrate de configurar correctamente la carpeta **Scripts**, donde se definen los paths del framework y las collections de Postman.

### Ejecución con TestSprite

```powershell
.\run-test-with-agent-bg.ps1 -Collection "Libranzas.postman_collection.json" -Environment "..\QA.postman_environment.json" -Iterations 1 -TriggerTestSprite
```

---

## ✅ Recomendaciones Finales

* Verifica siempre las rutas de los archivos `.json`.
* Ejecuta PowerShell como administrador para evitar problemas de permisos.
* Usa iteraciones bajas antes de ejecutar pruebas intensas o en paralelo.

---

📌 **Fin del documento**
