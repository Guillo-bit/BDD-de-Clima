import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/clima/clima_repositorio.dart';
import 'data/shared/favorite_prefs.dart';
import 'logic/clima_cubit.dart';
import 'logic/favoritos_cubit.dart';
import 'presentation/pages/pagina_principal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final climaRepo = ClimaRepositorio();
    final favoritesPrefs = FavoritePrefs();

    return MultiBlocProvider(
      providers: [
        BlocProvider<CubitClima>(
          create: (context) => CubitClima(climaRepo),
        ),
        BlocProvider<FavoritosCubit>(
          create: (context) =>
              FavoritosCubit(favoritesPrefs)..cargarFavoritos(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tiempermo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: PaginaPrincipal(),
      ),
    );
  }
}
