echo "Ejecutando la app Flutter BDD-de-Clima..."

cd ~/proyecto/BDD-de-Clima || { echo "Directorio del proyceto no encontrado"; exit 1; }

flutter clean

flutter pub get

flutter run

echo "Completado"
