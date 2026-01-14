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
git clone https://github.com/Alexandra-GNB/DevTools.git
cd (nueva carpeta-de-tu-repositorio)
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
### Respuesta en consola – Prueba de Carga

```Respuesta en consola

Running Newman: Collection=C:\Users\Auto\Libranzas.postman_collection.json Environment=C:\Users\SQA\Auto\avance\QA.postman_environment.json Iterations=1
=====================================
  Newman - Prueba de Carga
=====================================

Collection: C:\Users\SQA\Auto\avance\Libranzas.postman_collection.json
Environment: C:\Users\SQA\Auto\avance\QA.postman_environment.json
Iteraciones: 1
Delay entre ejecuciones: 1 segundos

[1/1] Ejecutando prueba...
newman

Libranzas

□ sin CXC sin REF
└ Autenticacion
  POST https://ilqa.bancognb.com.co//oauth-tpp/api/public/v1/oauth [200 OK, 2.27kB, 1220ms]
  √  Token capturado correctamente
  ┌
  │ 'Token capturado'
  └

└ CREAR CASO
  POST https://ilqa.bancognb.com.co//credit-application/api/public/payroll-loans/v1/cases [200 OK, 870B, 6.9s]
  ┌
  │ '✓ Variables guardadas:'
  │ '  - CaseId:', '17050326'
  │ '  - CaseNumber:', 'LULO-26-131'
  └
  √  ✅ Caso creado correctamente: 200
  √  ✅ CaseId obtenido correctamente
  √  ✅ CaseNumber obtenido correctamente

└ SIMULACION
  POST https://ilqa.bancognb.com.co//credit-application/api/public/payroll-loans/v1/simulations [200 OK, 861B, 8.8s]
  ┌
  │ 'OperationNumber guardado:', 878051833
  │ '\n=== RESPUESTA COMPLETA ==='
  │ '{\n' +
  │   '  "Data": {\n' +
  │   '    "SimulationOk": true,\n' +
  │   '    "OperationNumber": 878051833,\n' +
  │   '    "SubOperationNumber": 0,\n' +
  │   '    "Amount": 94615000,\n' +
  │   '    "LoanTerm": 120,\n' +
  │   '    "RateMV": 1.5,\n' +
  │   '    "loanInstallment": 1879941,\n' +
  │   '    "RateEA": 19.561817,\n' +
  │   '    "Creditworthiness": 94417969.39,\n' +
  │   '    "FinantialSectorCME": 195565914.49,\n' +
  │   '    "ApprovalResult": "NEGADO",\n' +
  │   '    "HasUnmetCreditPolicies": false,\n' +
  │   '    "HasUnmetCreditPoliciesBloqued": false,\n' +
  │   '    "UnmetCreditPolicies": [],\n' +
  │   '    "VTUPercentage": 20.36123344327101,\n' +
  │   '    "AccruedInterest": 0\n' +
  │   '  }\n' +
  │   '}'
  └
  √  Data recibida correctamente
  √  ApprovalResult: NEGADO
  √  UnmetCreditPolicies: 0 politicas incumplidas

└ AVANZAR CASO sin CC sin REF
  PUT https://ilqa.bancognb.com.co//credit-application/api/public/payroll-loans/v1/cases/17050326' [200 OK, 454B, 9.4s]
  ┌
  │ 'Is Update:', true
  └
  √  ✅ Status: 200
  √  ✅ IsUpdated es verdadero

└ RATES - TASAS
  GET https://ilqa.bancognb.com.co//credit-application/api/public/payroll-loans/v1/rates?caseNumber=LULO-26-131&paymentAgencyCode=123334&businessTypeCode=1668 [200 OK, 1.06kB, 648ms]        
  √  Status: 200
  √  ✅ Data: {"GenericalRateMV":1.4,"GenericalRateEA":18.155913,"RetentionRateMV":0,"RetentionRateEA":0,"DebtPurchaseRateNormalMV":0,"DebtPurchaseRateNormalEA":0,"DebtPurchaseRateCrediExpressMV":1.4,"DebtPurchaseRateCrediExpressEA":18.155913,"SpecialDebtPurchaseRateMV":1.449996,"SpecialDebtPurchaseRateEA":18.856903,"PrimeRateDetail":[{"ProcType":2,"ApprovalType":5,"DateFrom":"2025-07-27","DateTo":"2026-11-01","AmountUpTo":0,"LoanTerm":0,"IncomesUpTo":2,"RateMV":1.33},{"ProcType":2,"ApprovalType":5,"DateFrom":"2025-07-27","DateTo":"2026-11-01","AmountUpTo":0,"LoanTerm":0,"IncomesUpTo":4,"RateMV":1.22}]}
  ┌
  │ '\n=== PRIME RATE DETAIL ==='
  │ '\nRegistro 1:'
  │ '  ProcType: 2'
  │ '  ApprovalType: 5'
  │ '  DateFrom: 2025-07-27'
  │ '  DateTo: 2026-11-01'
  │ '  AmountUpTo: 0'
  │ '  LoanTerm: 0'
  │ '  IncomesUpTo: 2'
  │ '  RateMV: 1.33'
  │ '\nRegistro 2:'
  │ '  ProcType: 2'
  │ '  ApprovalType: 5'
  │ '  DateFrom: 2025-07-27'
  │ '  DateTo: 2026-11-01'
  │ '  AmountUpTo: 0'
  │ '  LoanTerm: 0'
  │ '  IncomesUpTo: 4'
  │ '  RateMV: 1.22'
  └
  √  📋 PrimeRateDetail: 2 registros

└ Envio Documento- Files
  POST https://ilqa.bancognb.com.co//document-management/api/public/v1/documents [200 OK, 477B, 2.7s]
  √  ✅ Status: 200
  ┌
  │ '=== DATOS DE RESPUESTA ==='
  │ 'isUpload: true'
  └

└ Balances-Saldos
  GET https://ilqa.bancognb.com.co//credit-application/api/public/payroll-loans/v1/balances?OperationNumber=878051833&SubOperationNumber=000&IdentificationNumber=28737378&IdentificationType=1 [200 OK, 724B, 600ms]
  √  ✅ Balance de saldos obtenidos: 200
  ┌
  │ '=== DATOS DE RESPUESTA ==='
  │ 'Balance: 0'
  │ 'Status: 0'
  │ 'PastDueDays: 0'
  │ 'AmountOfNextPayment: 382689'
  │ 'LoanTerm: 36'
  │ 'PendingInstallments: 36'
  │ 'LoanInstallment: 382689'
  │ 'RateMV: 0'
  └

└ PRODUCTS-ObligacionesVigentes
  GET https://ilqa.bancognb.com.co//credit-application/api/public/payroll-loans/v1/products?CaseId=AAAA-25-2345&IdentificationNumber=28737378&IdentificationType=1 [200 OK, 867B, 1563ms]     
  √  Status: 200
  ┌
  │ '=== RESPUESTA COMPLETA ==='
  │ '{\n' +
  │   '  "Data": {\n' +
  │   '    "CreditOperationsToBeRefinanced": [\n' +
  │   '      {\n' +
  │   '        "Balance": 23478525,\n' +
  │   '        "OperationNumber": 106504318,\n' +
  │   '        "SubOperationNumber": 0,\n' +
  │   '        "RateMV": 1.3,\n' +
  │   '        "OfficeCode": 50,\n' +
  │   '        "CustomerId": 894037,\n' +
  │   '        "OperationType": 0,\n' +
  │   '        "LoanTerm": 125,\n' +
  │   '        "LoanInstallment": 594034,\n' +
  │   '        "PaymentAgencyCode": 109973,\n' +
  │   '        "OperationStatus": 0,\n' +
  │   '        "BusinessTypeCode": 747\n' +
  │   '      }\n' +
  │   '    ]\n' +
  │   '  }\n' +
  │   '}'
  └
  √  ✅ Data: {"CreditOperationsToBeRefinanced":}

┌─────────────────────────┬───────────────────┬───────────────────┐
│                         │          executed │            failed │
├─────────────────────────┼───────────────────┼───────────────────┤
│              iterations │                 1 │                 0 │
├─────────────────────────┼───────────────────┼───────────────────┤
│                requests │                 8 │                 0 │
├─────────────────────────┼───────────────────┼───────────────────┤
│            test-scripts │                 8 │                 0 │
├─────────────────────────┼───────────────────┼───────────────────┤
│      prerequest-scripts │                 1 │                 0 │
├─────────────────────────┼───────────────────┼───────────────────┤
│              assertions │                16 │                 0 │
├─────────────────────────┴───────────────────┴───────────────────┤
│ total run duration: 32.5s                                       │
├─────────────────────────────────────────────────────────────────┤
│ total data received: 3.03kB (approx)                            │
├─────────────────────────────────────────────────────────────────┤
│ average response time: 3.9s [min: 600ms, max: 9.4s, s.d.: 3.5s] │
└─────────────────────────────────────────────────────────────────┘

  -> Reporte HTML generado: newman-reports/report_20260114_112506_iter1.html
    Tests: 16 ejecutados | 0 fallidos
  OK Iteracion 1 completada exitosamente

=====================================
  RESUMEN DE EJECUCION
=====================================
Total ejecutadas: 1
Exitosas: 1
Fallidas: 0
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
