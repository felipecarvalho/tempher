import 'package:tempher/features/weather/domain/entities/city_coordinates.dart';
import 'package:tempher/features/weather/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Weather> getWeatherByCity(String city);
  Future<CityCoordinates> getCityCoordinates(String city);
  Future<Map<String, dynamic>> getWeatherByCoordinates(double latitude, double longitude);
}
