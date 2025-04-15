import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/clima_cubit.dart';

class DetallesPage extends StatelessWidget {
  const DetallesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Usp de BlocBuilder para reconstruir la UI de acorde al estado actual del Clima
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      appBar: AppBar(
        title: const Text('Detalles del Clima'),
      ),
      body: Center(
        child: BlocBuilder<CubitClima, dynamic>(
          builder: (context, state) {
            if (state.ciudad.isEmpty) {
              return const Text('No hay datos para mostrar.');
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Ciudad: ${state.ciudad}',
                    style: const TextStyle(fontSize: 24)),
                Text('🌡 Temperatura: ${state.temperatura} °C',
                    style: const TextStyle(fontSize: 24)),
                Text('💧 Humedad, ${state.humedad}%',
                    style: const TextStyle(fontSize: 24)),
                Text('💨 Velocidad del Viento: ${state.velocidadViento} m/s',
                    style: const TextStyle(fontSize: 24)),
                Text('☁️ Nubosidad: ${state.nubosidad} %',
                    style: const TextStyle(fontSize: 24)),
              ],
            );
          },
        ),
      ),
    );
  }
}
