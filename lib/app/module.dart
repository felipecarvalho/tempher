import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tempher/core/widgets/widgets.dart';
import 'package:tempher/features/about/about.dart';
import 'package:tempher/features/weather/weather.dart';
import 'package:tempher/features/weather_details/presentation/bloc/weather_details_bloc.dart';
import 'package:tempher/features/weather_details/presentation/views/weather_details_view.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => kDebugMode ? const WeatherView() : const Splash(redirectPath: '/weather'),
    );

    r.child(
      '/about',
      child: (context) => const AboutView(),
    );

    r.child(
      '/weather',
      child: (context) => const WeatherView(),
      transition: TransitionType.fadeIn,
    );

    r.child(
      '/weather/details',
      child: (context) => BlocProvider(
        create: (context) => WeatherDetailsBloc(),
        child: WeatherDetailsView(
          latitude: r.args.queryParams['lat']!,
          longitude: r.args.queryParams['lon']!,
          cityName: r.args.queryParams['city']!,
        ),
      ),
    );
  }
}
