# BDD-de-Clima

Esta aplicación móvil creada en Flutter permite al usuario consultar el clima de una ciudad de su preferencia mediante el uso de la API de OpenWeatherMap.

Este programa está compuesto por los siguientes archivos escritos en el leguaje `dart`:

## Archivos

### 1. `clima_data_provider`

Consulta el clima a la API de OpenWeatherMap

### 2. `clima_modelo.dart`

Es un modelo quie maneja la información referente al clima.

### 3. `clima_repositorio.dart`

Usa el DataProvider para extraer la información del clima.

### 4. `favorites_prefs`

Utiliza `SharedPreferences` para gestionar las ciudades preferidas. Almacena una lista de `Strings` con los nombres de las ciudades favoritas.

### 5. `clima_cubit`

Es un Cubit que reutiliza al repositorio para manejar el estado del clima.

### 6. `favoritos_cubit`

Un Cubit que maneja la lista de ciudades favoritas mediante `SharedPreferences`

### 7. `detalles_page`

Pantalla que muestra los *Detalles Completos* del clima: humedad, velocidad del viento, y nubosidad

### 8. `pagina_principal`

Es la pantalla principal de la aplicación, mostrando la información básica, la observación de detalles, y gestionando las favoritas.

### 9. `main.dart`

Archivo principal inyectador de los Cubit usando `MultiBlocProvider`, e inicializa la Paz.

## ¿Cómo correr la App?

### Clonar el repositorio

Se puede clonar el repositorio con un `fork`, o directamente descargando el archivo `zip` del proyecto.

Una vez hecho esto, se puede crear un nuevo proyecto de Flutter, y sobreescribirlo con los archivos del proyecto hecho en GitHub.

### Añadir las dependencias necesarias

Es importante añadir las dependencias que permiten que la app corra con normalidad. En las líneas que comienzan por "`import`" y que marquen error, abrir una nueva terminal dentro del directorio del proyecto clonado, y añadir las dependencias; por ejemplo, si la línea que indica el error se llama `import 'package:flutter_bloc/flutter_bloc.dart';`, quiere decir que la dependencia `flutter_bloc` falta; por lo tanto, se tiene que escribir la línea `flutter pub add flutter_bloc`, y así sucesivamente con el resto de dependencias.

Esto modificará el archivo `pubspec.yaml` de forma automática, sin necesidad de hacerlo manualmente.

## Demostrciones de la funcionalidad de la App

![Image](https://github.com/user-attachments/assets/749f036b-f682-417c-90ac-47509948c791)

![Image](https://github.com/user-attachments/assets/2ae81d8b-ca08-4611-b182-8a2826a24ed1)

![Image](https://github.com/user-attachments/assets/171923e4-d870-4240-b2b0-9225586e0d5b)

![Image](https://github.com/user-attachments/assets/68f36272-32f5-4b28-b04b-5a9683440d92)

![Image](https://github.com/user-attachments/assets/6117003b-8d11-4176-9b68-108576dfccbe)

![Image](https://github.com/user-attachments/assets/11f77ace-b5a0-4fa5-a307-812c37f4482b)

![Image](https://github.com/user-attachments/assets/5e53a6ea-1aba-49af-abd6-4df41b9bf3fb)
## Comentarios Adicionales

Se eligió a `SharedPreferences` en lugar de `SQLite`, debido a que este último requería la creación de tablas, mientras que las Preferencias Compartidas proporcionan simplemente métodos que le permiten al usuario crear y borrar climas de ciudades favoritas.}

Finalmente, en caso de que se quiera correr la App mediante un emulador de Android Studio, hay la posibilidad que surja un error relacionado con el fichero `settings.gradle`, alojado dentro de la carpeta `android`. Esto tiene que ver con la versión de `com.andoid.application` dentro de los `plugins` de este archivo; la versión mínima requerida para compilar la App en este escenario, es teniendo, al menos, una versión `8.2.1`; simplemente, se debe reemplazar el número de esta línea, con el mencionado. De esta forma, se correrá el proyecto sin problema alguno.

## CI/CD – Despliegue automático con GitHub Actions

### Objetivo
Implementar un flujo de trabajo de **Integración y Despliegue Continuo (CI/CD)** usando **GitHub Actions**, que permita **desplegar automáticamente la aplicación** en un servidor **Ubuntu** mediante una **conexión SSH segura**, cada vez que se realiza un `push` a la rama `main`.

---

### Tecnologías utilizadas
- GitHub Actions  
- Runner self-hosted en Ubuntu 24.04  
- SSH con llaves ED25519  
- Git  
- Flutter (aplicación de ejemplo)

---

### ¿Cómo funciona el despliegue?
1. Se realiza un `push` a la rama **main** del repositorio.
2. GitHub Actions ejecuta el workflow `deploy.yml`.
3. El **runner self-hosted** instalado en el servidor Ubuntu:
   - Clona o actualiza el repositorio (`git pull`)
   - Instala dependencias
   - Compila y ejecuta la aplicación automáticamente
4. El despliegue se completa sin intervención manual.

---

### Seguridad y buenas prácticas
- Se utilizaron **llaves SSH ED25519** para autenticación segura.
- La **clave privada nunca se sube al repositorio**.
- Las llaves se almacenan y gestionan mediante **GitHub Secrets**.
- Permisos correctos en el servidor:
  - `~/.ssh` → `700`
  - `id_ed25519` → `600`
- Autenticación SSH **sin contraseña**.
- Información sensible (IP, usuario, rutas) **no expuesta** en el repositorio.

---

### Workflow CI/CD
El archivo `.github/workflows/deploy.yml`:
- Se activa automáticamente al hacer `push` en `main`.
- Usa un **runner self-hosted**.
- Ejecuta comandos remotos para actualizar y desplegar la aplicación.
- Permite verificar el estado del despliegue desde la pestaña **Actions** de GitHub.

---

### Evidencia del funcionamiento
Se adjuntan capturas donde se observa:
- Runner activo y conectado a GitHub.
<img width="986" height="278" alt="Runner" src="https://github.com/user-attachments/assets/a5322080-888d-4b78-8439-e4dc221eb276" />
- Ejecución exitosa del workflow.
<img width="1622" height="1167" alt="Todos los Intentos" src="https://github.com/user-attachments/assets/ba9f6b1c-7819-48ce-b02d-3eb4d6cde80d" />
- Compilación e instalación automática de la aplicación.
<img width="747" height="472" alt="image" src="https://github.com/user-attachments/assets/67b1d53c-d8e3-4a84-8484-4402d4886e3d" />

---

### Problemas encontrados y soluciones
- **Errores de autenticación SSH**: solucionados ajustando permisos de las llaves.
- **Error de display en Linux**: se adaptó el despliegue a dispositivo Android.
- **Advertencias de Gradle/Kotlin**: documentadas, no bloquean el despliegue.

---

### Conclusión
El flujo CI/CD fue implementado con éxito.  
Cada cambio enviado a la rama `main` se despliega automáticamente en el servidor Ubuntu mediante una conexión SSH segura, cumpliendo con los principios de automatización, seguridad y buenas prácticas.
