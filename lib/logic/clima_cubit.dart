import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/clima/clima_modelo.dart';
import '../data/clima/clima_repositorio.dart';

class CubitClima extends Cubit<EstadoClima> {
  final ClimaRepositorio repositorio;

  CubitClima(this.repositorio) : super(EstadoClima());

  void obtenerClima(String ciudad) async {
    emit(EstadoClima(ciudad: ciudad, estaCargando: true));

    try {
      final clima = await repositorio.getClima(ciudad);
      emit(EstadoClima(
        ciudad: clima.ciudad,
        temperatura: clima.temperatura,
        humedad: clima.humedad,
        velocidadViento: clima.velocidadViento,
        nubosidad: clima.nubosidad,
        estaCargando: false,
      ));
    } catch (e) {
      emit(EstadoClima(ciudad: ciudad, estaCargando: false, error: toString()));
    }
  }
}
