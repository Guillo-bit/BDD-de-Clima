class EstadoClima {
  final String ciudad;
  final double temperatura;
  final int humedad;
  final double velocidadViento;
  final int nubosidad;
  final bool estaCargando;
  final String? error;

  EstadoClima({
    this.ciudad = '',
    this.temperatura = 0.0,
    this.humedad = 0,
    this.velocidadViento = 0.0,
    this.nubosidad = 0,
    this.estaCargando = false,
    this.error,
  });
}
