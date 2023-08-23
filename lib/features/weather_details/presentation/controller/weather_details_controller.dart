import 'package:tempher/core/helpers/helpers.dart';
import 'package:tempher/features/weather_details/domain/entities/weather_entry.dart';
import 'package:tempher/features/weather_details/presentation/bloc/weather_details_bloc.dart';

class WeatherDetailsController extends ViewController {
  late final WeatherDetailsBloc weatherDetailsBloc = WeatherDetailsBloc();

  List<WeatherEntry> filterFirstEntryOfEachDate(List<WeatherEntry> entries) {
    final Map<DateTime, WeatherEntry> firstEntryMap = {};
    for (final entry in entries) {
      final date = DateTime(entry.date.year, entry.date.month, entry.date.day);
      if (!firstEntryMap.containsKey(date)) {
        firstEntryMap[date] = entry;
      }
    }
    return firstEntryMap.values.toList();
  }
}
