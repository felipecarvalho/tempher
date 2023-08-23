import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tempher/core/helpers/helpers.dart';
import 'package:tempher/core/theme/theme.dart';
import 'package:tempher/features/weather/presentation/widgets/city_list_tile/city_list_tile.dart';
import 'package:tempher/core/widgets/widgets.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:tempher/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:tempher/features/weather/presentation/controller/weather_controller.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  final WeatherController _weatherController = WeatherController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _weatherController.weatherBloc,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Container(
            padding: EdgeInsets.symmetric(horizontal: ThemeMetrics.appBarPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Logo(isLight: false, isVertical: true),
                NavigationIcon(
                  icon: LucideIcons.helpCircle,
                  onTap: () => Navigate.push('/about'),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: ThemeMetrics.defaultPadding),
          child: BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
            if (state is WeatherLoaded || state is WeatherError) _weatherController.searchController.clear();
            return Column(
              children: [
                Spacing(),
                SearchTextField(
                  isLoading: state is WeatherLoading ? true : false,
                  controller: _weatherController.searchController,
                  onSubmit: () => _weatherController.submitSearch(),
                ),
                Spacing(spacing: SpacingType.large),
                if (state is WeatherInitial) ...[
                  Container(),
                ],
                if (state is WeatherLoaded) ...[
                  GestureDetector(
                    onTap: () => _weatherController.toWeatherDetails(
                      state.weatherData.latitude,
                      state.weatherData.longitude,
                      state.weatherData.cityName,
                    ),
                    child: CityListTile(
                      cityName: state.weatherData.cityName,
                      maxTemp: state.weatherData.maxTemp.toString(),
                      currentTemp: state.weatherData.currentTemp.toString(),
                      minTemp: state.weatherData.minTemp.toString(),
                    ),
                  ),
                ],
                if (state is WeatherError) ...[
                  Text(
                    state.errorMessage,
                    style: ThemeTextStyle.body2,
                    textAlign: TextAlign.center,
                  ),
                ] else ...[
                  Container()
                ]
              ],
            );
          }),
        ),
      ),
    );
  }
}
