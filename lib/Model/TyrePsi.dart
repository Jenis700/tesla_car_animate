class TyresPsi {
  final double psi;
  final int temp;
  final bool isLowPressure;

  TyresPsi({required this.psi, required this.temp, required this.isLowPressure});
}

final List<TyresPsi> demoPsiList = [
  TyresPsi(psi: 23.6, temp: 44, isLowPressure: true),
  TyresPsi(psi: 35.0, temp: 41, isLowPressure: false),
  TyresPsi(psi: 34.6, temp: 46, isLowPressure: false),
  TyresPsi(psi: 32.8, temp: 42, isLowPressure: false),
];
