class Weather {
  final String cityName;
  final double latitude;
  final double longitude;
  final double currentTemp;
  final double maxTemp;
  final double minTemp;

  Weather({
    required this.cityName,
    required this.latitude,
    required this.longitude,
    required this.currentTemp,
    required this.maxTemp,
    required this.minTemp,
  });
}
