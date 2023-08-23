class WeatherModel {
  double currentTemp;
  double maxTemp;
  double minTemp;

  WeatherModel({
    required this.currentTemp,
    required this.maxTemp,
    required this.minTemp,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      currentTemp: json['main']['temp'] ?? 0,
      maxTemp: json['main']['temp_max'] ?? 0,
      minTemp: json['main']['temp_min'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'currentTemp': currentTemp,
      'maxTemp': maxTemp,
      'minTemp': minTemp,
    };
  }
}
