part of 'weather_details_bloc.dart';

abstract class WeatherDetailsState {}

class WeatherDetailsInitial extends WeatherDetailsState {}

class WeatherDetailsLoading extends WeatherDetailsState {}

class WeatherDetailsLoaded extends WeatherDetailsState {
  final WeatherDetails weatherDetails;

  WeatherDetailsLoaded(this.weatherDetails);
}

class WeatherDetailsError extends WeatherDetailsState {
  final String message;

  WeatherDetailsError(this.message);
}
