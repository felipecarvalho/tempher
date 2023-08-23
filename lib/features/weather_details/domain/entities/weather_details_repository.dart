import 'package:tempher/features/weather_details/domain/entities/weather_details.dart';

abstract class WeatherDetailsRepository {
  Future<WeatherDetails> getWeatherDetails(double latitude, double longitude);
}
