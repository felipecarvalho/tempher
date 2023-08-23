import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:tempher/core/helpers/helpers.dart';
import 'package:tempher/core/theme/theme.dart';
import 'package:tempher/core/widgets/widgets.dart';
import 'package:tempher/features/weather_details/presentation/bloc/weather_details_bloc.dart';
import 'package:tempher/features/weather_details/presentation/controller/weather_details_controller.dart';
import 'package:tempher/features/weather_details/presentation/widgets/weather_details_card.dart';

class WeatherDetailsView extends StatefulWidget {
  final String latitude;
  final String longitude;
  final String cityName;

  const WeatherDetailsView({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.cityName,
  });

  @override
  State<WeatherDetailsView> createState() => _WeatherDetailsViewState();
}

class _WeatherDetailsViewState extends State<WeatherDetailsView> {
  final WeatherDetailsController _weatherDetailsController = WeatherDetailsController();

  @override
  void initState() {
    context.read<WeatherDetailsBloc>().fetchWeatherDetails(
          double.parse(widget.latitude),
          double.parse(widget.longitude),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavigationIcon(
              icon: LucideIcons.arrowLeft,
              onTap: () => Navigate.pop(),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: ThemeMetrics.defaultPadding),
        child: BlocBuilder<WeatherDetailsBloc, WeatherDetailsState>(
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state is WeatherDetailsLoading) ...[
                    CircularProgressIndicator(
                      strokeWidth: ThemeMetrics.loadingStroke,
                    ),
                  ],
                  if (state is WeatherDetailsLoaded) ...[
                    Expanded(
                      child: ListView(
                        children: [
                          Column(
                            children: [
                              Spacing(),
                              Text(widget.cityName, style: ThemeTextStyle.headline3),
                              Text(
                                '${state.weatherDetails.entries[0].currentTemp.toString()}º',
                                style: ThemeTextStyle.headline,
                              ),
                              Text(
                                toBeginningOfSentenceCase(state.weatherDetails.entries[0].description.toString())
                                    .toString(),
                                style: ThemeTextStyle.body,
                              ),
                              Spacing(spacing: SpacingType.extraLarge),
                              Text('weatherDetails.fiveDayForecast', style: ThemeTextStyle.caption).tr(),
                              Builder(
                                builder: (_) {
                                  final filteredEntries = _weatherDetailsController
                                      .filterFirstEntryOfEachDate(state.weatherDetails.entries);
                                  List<Widget> weatherCards = [];
                                  for (var entry in filteredEntries) {
                                    weatherCards.add(WeatherDetailsCard(entry));
                                  }
                                  return Column(children: weatherCards);
                                },
                              ),
                              Spacing(spacing: SpacingType.large),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                  if (state is WeatherDetailsError) ...[
                    Text(
                      state.message,
                      style: ThemeTextStyle.body2,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
