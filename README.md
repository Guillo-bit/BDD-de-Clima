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

![Image](https://github.com/user-attachments/assets/171923e4-d870-4240-b2b0-9225586e0d5b)

![Image](https://github.com/user-attachments/assets/749f036b-f682-417c-90ac-47509948c791)

![Image](https://github.com/user-attachments/assets/8921427a-a2a2-4fc7-ac50-9d7913b7abe5)

![Image](https://github.com/user-attachments/assets/68f36272-32f5-4b28-b04b-5a9683440d92)

![Image](https://github.com/user-attachments/assets/11f77ace-b5a0-4fa5-a307-812c37f4482b)

![Image](https://github.com/user-attachments/assets/6117003b-8d11-4176-9b68-108576dfccbe)

![Image](https://github.com/user-attachments/assets/2ae81d8b-ca08-4611-b182-8a2826a24ed1)