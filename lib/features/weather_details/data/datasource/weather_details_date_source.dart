import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tempher/core/helpers/helpers.dart';
import 'package:tempher/features/weather_details/domain/entities/weather_details.dart';
import 'package:tempher/features/weather_details/domain/entities/weather_details_repository.dart';
import 'package:tempher/features/weather_details/domain/entities/weather_entry.dart';

class WeatherDetailsDataSource implements WeatherDetailsRepository {
  final Dio _dio = Dio();
  final String language = Platform.localeName;

  @override
  Future<WeatherDetails> getWeatherDetails(double latitude, double longitude) async {
    String languageCode = language.split('_')[0].toLowerCase();

    try {
      final response = await _dio.get(
        'https://api.openweathermap.org/data/2.5/forecast',
        queryParameters: {
          'lat': latitude,
          'lon': longitude,
          'appid': 'bd5e378503939ddaee76f12ad7a97608',
          'lang': languageCode,
          'units': 'metric',
        },
      );

      final List<dynamic> list = json.decode(response.toString())['list'];

      final entries = <WeatherEntry>[];

      DateTime currentDate = DateTime.now().subtract(const Duration(days: 1));

      for (var entryJson in list) {
        final date = DateTime.fromMillisecondsSinceEpoch(entryJson['dt'] * 1000);
        if (date.day != currentDate.day) {
          final main = entryJson['main'];
          final weather = entryJson['weather'][0];

          entries.add(WeatherEntry(
            date: date,
            description: weather['description'],
            currentTemp: main['temp'],
            maxTemp: main['temp_max'],
            minTemp: main['temp_min'],
          ));

          currentDate = date;
        }
      }

      DebugMode.showOnLog(
        response.data.toString(),
        method: 'getWeatherDetails',
        className: WeatherDetailsDataSource,
        type: LogType.success,
      );
      return WeatherDetails(entries: entries);
    } catch (e) {
      DebugMode.showOnLog(
        e.toString(),
        method: 'getWeatherDetails',
        className: WeatherDetailsDataSource,
        type: LogType.error,
      );
      throw tr('errors.forecastNotFound');
    }
  }
}
