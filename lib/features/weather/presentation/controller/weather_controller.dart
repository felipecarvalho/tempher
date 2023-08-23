import 'package:flutter/material.dart';
import 'package:tempher/core/helpers/helpers.dart';
import 'package:tempher/features/weather/presentation/bloc/weather_bloc.dart';

class WeatherController extends ViewController {
  final TextEditingController searchController = TextEditingController();
  late final WeatherBloc weatherBloc = WeatherBloc();

  submitSearch() {
    weatherBloc.getWeatherByCity(searchController.text);
    FocusManager.instance.primaryFocus?.unfocus();
  }

  toWeatherDetails(double latitude, double longitude, String cityName) {
    FocusManager.instance.primaryFocus?.unfocus();
    Navigate.push(
      '/weather/details?lat=$latitude&lon=$longitude&city=$cityName',
    );
  }
}
