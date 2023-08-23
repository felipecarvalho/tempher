import 'dart:io';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tempher/core/helpers/helpers.dart';
import 'package:tempher/features/weather/data/model/city_coordinates_model.dart';
import 'package:tempher/features/weather/data/model/weather_model.dart';
import 'package:tempher/features/weather/domain/entities/city_coordinates.dart';
import 'package:tempher/features/weather/domain/entities/weather.dart';
import 'package:tempher/features/weather/domain/entities/weather_repository.dart';

class WeatherDataSource implements WeatherRepository {
  final Dio _dio = Dio();
  final language = Platform.localeName;

  @override
  Future<Weather> getWeatherByCity(String city) async {
    late String cityName = '';
    String languageCode = language.split('_')[0].toLowerCase();

    final coordinates = await getCityCoordinates(city);
    final weatherData = await getWeatherByCoordinates(coordinates.lat, coordinates.lon);

    WeatherModel weather = WeatherModel.fromJson(weatherData);

    if (coordinates.localNames != null && coordinates.localNames![languageCode] != null) {
      cityName = coordinates.localNames![languageCode];
    } else {
      cityName = coordinates.name;
    }

    return Weather(
      cityName: cityName,
      currentTemp: weather.currentTemp,
      maxTemp: weather.maxTemp,
      minTemp: weather.minTemp,
      latitude: coordinates.lat,
      longitude: coordinates.lon,
    );
  }

  @override
  Future<CityCoordinates> getCityCoordinates(String city) async {
    try {
      final response = await _dio.get(
        'http://api.openweathermap.org/geo/1.0/direct',
        queryParameters: {
          'q': city,
          'limit': 1,
          'appid': 'bd5e378503939ddaee76f12ad7a97608',
        },
      );

      DebugMode.showOnLog(
        response.data[0].toString(),
        method: 'getCityCoordinates',
        className: WeatherDataSource,
        type: LogType.success,
      );
      CityCoordinatesModel coordinatesData = CityCoordinatesModel.fromJson(response.data[0]);

      return CityCoordinates(
        lat: coordinatesData.lat,
        lon: coordinatesData.lon,
        name: coordinatesData.name,
        localNames: coordinatesData.localNames,
      );
    } catch (e) {
      DebugMode.showOnLog(
        e.toString(),
        method: 'getCityCoordinates',
        className: WeatherDataSource,
        type: LogType.error,
      );
      throw tr('errors.cityNotFound');
    }
  }

  @override
  Future<Map<String, dynamic>> getWeatherByCoordinates(double latitude, double longitude) async {
    try {
      final response = await _dio.get(
        'https://api.openweathermap.org/data/2.5/weather',
        queryParameters: {
          'lat': latitude,
          'lon': longitude,
          'appid': 'bd5e378503939ddaee76f12ad7a97608',
          'lang': language,
          'units': 'metric',
        },
      );

      DebugMode.showOnLog(
        response.data.toString(),
        method: 'getWeatherByCoordinates',
        className: WeatherDataSource,
        type: LogType.success,
      );
      return response.data;
    } catch (e) {
      DebugMode.showOnLog(
        e.toString(),
        method: 'getWeatherByCoordinates',
        className: WeatherDataSource,
        type: LogType.error,
      );
      throw tr('errors.tempNotFound');
    }
  }
}
