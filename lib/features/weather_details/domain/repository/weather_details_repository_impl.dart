import 'package:tempher/features/weather_details/data/datasource/weather_details_date_source.dart';
import 'package:tempher/features/weather_details/domain/entities/weather_details.dart';
import 'package:tempher/features/weather_details/domain/entities/weather_details_repository.dart';

class WeatherDetailsRepositoryImpl implements WeatherDetailsRepository {
  final WeatherDetailsDataSource _datasource = WeatherDetailsDataSource();

  @override
  Future<WeatherDetails> getWeatherDetails(double latitude, double longitude) {
    return _datasource.getWeatherDetails(latitude, longitude);
  }
}
