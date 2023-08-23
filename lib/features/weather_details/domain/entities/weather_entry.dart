class WeatherEntry {
  final DateTime date;
  final String description;
  final double currentTemp;
  final double maxTemp;
  final double minTemp;

  WeatherEntry({
    required this.date,
    required this.description,
    required this.currentTemp,
    required this.maxTemp,
    required this.minTemp,
  });
}
