import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/shared/favorite_prefs.dart';

class FavoritosState {
  final List<String> ciudades;
  final bool estaCargando;
  final String? error;

  FavoritosState({
    this.ciudades = const [],
    this.estaCargando = false,
    this.error,
  });
}

class FavoritosCubit extends Cubit<FavoritosState> {
  final FavoritePrefs prefs;

  FavoritosCubit(this.prefs) : super(FavoritosState());

  Future<void> cargarFavoritos() async {
    emit(FavoritosState(estaCargando: true));
    try {
      final ciudades = await prefs.loadFavoriteCities();
      emit(FavoritosState(ciudades: ciudades, estaCargando: false));
    } catch (e) {
      emit(FavoritosState(
        ciudades: state.ciudades,
        estaCargando: false,
        error: e.toString(),
      ));
    }
  }

  Future<void> agregarFavorito(String ciudad) async {
    try {
      await prefs.saveFavoriteCity(ciudad);
      cargarFavoritos(); // Recargar la Lista
    } catch (e) {
      emit(FavoritosState(
        ciudades: state.ciudades,
        estaCargando: false,
        error: e.toString(),
      ));
    }
  }

  Future<void> eliminarFavorito(String ciudad) async {
    try {
      await prefs.removeFavoriteCity(ciudad);
      cargarFavoritos();
    } catch (e) {
      emit(FavoritosState(
        ciudades: state.ciudades,
        estaCargando: false,
        error: e.toString(),
      ));
    }
  }
}
