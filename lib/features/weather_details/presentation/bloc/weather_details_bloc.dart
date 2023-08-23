import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tempher/features/weather_details/domain/entities/weather_details.dart';
import 'package:tempher/features/weather_details/domain/repository/weather_details_repository_impl.dart';

part 'weather_details_state.dart';

class WeatherDetailsBloc extends Cubit<WeatherDetailsState> {
  final WeatherDetailsRepositoryImpl _repository = WeatherDetailsRepositoryImpl();

  WeatherDetailsBloc() : super(WeatherDetailsInitial());

  void fetchWeatherDetails(double latitude, double longitude) async {
    emit(WeatherDetailsLoading());
    try {
      final weatherDetails = await _repository.getWeatherDetails(latitude, longitude);
      emit(WeatherDetailsLoaded(weatherDetails));
    } catch (e) {
      emit(WeatherDetailsError('Failed to fetch weather data.'));
    }
  }
}
