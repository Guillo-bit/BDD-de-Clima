import 'package:shared_preferences/shared_preferences.dart';

class FavoritePrefs {
  static const String _keyCiudades = 'ciudadesFavoritas';

  Future<List<String>> loadFavoriteCities() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_keyCiudades) ?? [];
  }

  Future<void> saveFavoriteCity(String ciudad) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> ciudades = prefs.getStringList(_keyCiudades) ?? [];
    // Evitar Duplicados
    if (!ciudades.contains(ciudad)) {
      ciudades.add(ciudad);
      await prefs.setStringList(_keyCiudades, ciudades);
    }
  }

  Future<void> removeFavoriteCity(String ciudad) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> ciudades = prefs.getStringList(_keyCiudades) ?? [];
    ciudades.remove(ciudad);
    await prefs.setStringList(_keyCiudades, ciudades);
  }
}
