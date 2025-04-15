import 'clima_data_provider.dart';
import 'clima_modelo.dart';

class ClimaRepositorio {
  final ClimaDataProvider dataProvider = ClimaDataProvider();

  Future<EstadoClima> getClima(String ciudad) async {
    try {
      final data = await dataProvider.obtenerClima(ciudad);
      return EstadoClima(
        ciudad: data['ciudad'],
        temperatura: data['temperatura'],
        humedad: data['humedad'],
        velocidadViento: data['velocidad'],
        nubosidad: data['nubosidad'],
      );
    } catch (e) {
      throw Exception("Error en el Repositorio: ${e.toString()}");
    }
  }
}
