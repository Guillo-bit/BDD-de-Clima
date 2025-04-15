import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/clima_cubit.dart';
import '../../logic/favoritos_cubit.dart';
import 'detalles_page.dart';

class PaginaPrincipal extends StatelessWidget {
  final TextEditingController ciudadControlador = TextEditingController();

  PaginaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    final cubitClima = context.read<CubitClima>();
    final favoritosCubit = context.read<FavoritosCubit>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Clima & Favoritos'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Sección de búsqueda de clima
            TextField(
              controller: ciudadControlador,
              decoration: const InputDecoration(
                labelText: 'Ingresa la Ciudad',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellowAccent,
              ),
              onPressed: () {
                final ciudad = ciudadControlador.text.trim();
                if (ciudad.isNotEmpty) {
                  cubitClima.obtenerClima(ciudad);
                }
              },
              child: const Text('Consultar Clima'),
            ),
            const SizedBox(height: 20),
            // Muestra la información básica del clima
            BlocBuilder<CubitClima, dynamic>(
              builder: (context, state) {
                if (state.estaCargando) {
                  return const CircularProgressIndicator();
                } else if (state.error != null) {
                  return Text('Error: ${state.error}',
                      style: const TextStyle(color: Colors.redAccent));
                } else if (state.ciudad.isNotEmpty) {
                  return Card(
                    color: Colors.grey[200],
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text('Ciudad: ${state.ciudad}',
                              style: const TextStyle(fontSize: 20)),
                          Text('Temperatura: ${state.temperatura}°C',
                              style: const TextStyle(fontSize: 20)),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightGreenAccent,
                            ),
                            onPressed: () {
                              // Navegar a la página de detalles
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const DetallesPage()),
                              );
                            },
                            child: const Text('Ver Más Detalles'),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                            ),
                            onPressed: () {
                              // Agregar la ciudad actual a favoritos
                              favoritosCubit.agregarFavorito(state.ciudad);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        'Ciudad "${state.ciudad}" agregada a favoritos.')),
                              );
                            },
                            child: const Text('Agregar a Favoritos'),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const Text(
                      'Ingresa una ciudad para consultar el clima');
                }
              },
            ),
            const Divider(height: 30),
            // Sección de ciudades favoritas
            const Text('Ciudades Favoritas ⭐', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            BlocBuilder<FavoritosCubit, FavoritosState>(
              builder: (context, favState) {
                if (favState.estaCargando) {
                  return const CircularProgressIndicator();
                } else if (favState.error != null) {
                  return Text('Error: ${favState.error}',
                      style: const TextStyle(color: Colors.red));
                } else if (favState.ciudades.isEmpty) {
                  return const Text('No hay ciudades favoritas guardadas.');
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: favState.ciudades.length,
                    itemBuilder: (context, index) {
                      final ciudadFav = favState.ciudades[index];
                      return ListTile(
                        title: Text('${index + 1}. $ciudadFav'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            favoritosCubit.eliminarFavorito(ciudadFav);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      'Ciudad "$ciudadFav" eliminada de favoritos.')),
                            );
                          },
                        ),
                        onTap: () {
                          // Al tocar la ciudad favorita, se consulta su clima
                          cubitClima.obtenerClima(ciudadFav);
                        },
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
