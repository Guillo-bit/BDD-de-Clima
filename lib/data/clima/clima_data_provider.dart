import 'dart:convert';
import 'package:http/http.dart' as http;

class ClimaDataProvider {
  static const String apiKey = '405bf247c2cccf7d32f76f2544e11bcd';
  static const String baseUrl =
      'https://api.openweathermap.org/data/2.5/weather';

  Future<Map<String, dynamic>> obtenerClima(String ciudad) async {
    final url =
        Uri.parse('$baseUrl?q=$ciudad&appid=$apiKey&units=metric&lang=es');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return {
        'ciudad': data['name'],
        'temperatura': (data['main']['temp'] as num).toDouble(),
        'humedad': data['main']['humidity'], // Porcentaje
        'velocidad': (data['wind']['speed'] as num).toDouble(), // m/s
        'nubosidad': data['clouds']['all'], // Porcentaje
      };
    } else {
      throw Exception('Error al obtener el clima: ${response.reasonPhrase}');
    }
  }
}
