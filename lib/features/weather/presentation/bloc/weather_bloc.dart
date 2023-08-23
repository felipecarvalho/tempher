import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tempher/features/weather/domain/entities/weather.dart';
import 'package:tempher/features/weather/domain/repository/weather_repository_impl.dart';

part 'weather_state.dart';

class WeatherBloc extends Cubit<WeatherState> {
  final WeatherRepositoryImpl _repository = WeatherRepositoryImpl();

  WeatherBloc() : super(WeatherInitial());

  Future<void> getWeatherByCity(String city) async {
    if (city.isEmpty || city.length <= 2) {
      emit(WeatherError(tr('weather.invalidCity')));
    } else {
      emit(WeatherLoading());
      try {
        final weatherData = await _repository.getWeatherByCity(city);
        emit(WeatherLoaded(weatherData));
      } catch (e) {
        emit(WeatherError(e.toString()));
      }
    }
  }
}
