import 'package:tempher/features/weather/data/datasource/weather_data_source.dart';
import 'package:tempher/features/weather/domain/entities/city_coordinates.dart';
import 'package:tempher/features/weather/domain/entities/weather.dart';
import 'package:tempher/features/weather/domain/entities/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDataSource _dataSource = WeatherDataSource();

  @override
  Future<Weather> getWeatherByCity(String city) async {
    return await _dataSource.getWeatherByCity(city);
  }

  @override
  Future<CityCoordinates> getCityCoordinates(String city) async {
    return await _dataSource.getCityCoordinates(city);
  }

  @override
  Future<Map<String, dynamic>> getWeatherByCoordinates(double latitude, double longitude) async {
    return await _dataSource.getWeatherByCoordinates(latitude, longitude);
  }
}
