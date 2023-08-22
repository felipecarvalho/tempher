import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tempher/core/widgets/widgets.dart';
import 'package:tempher/features/about/about.dart';
import 'package:tempher/features/home/home.dart';

class Routes extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => kDebugMode ? HomeView() : const Splash(redirectPath: '/home'),
    );
    r.child(
      '/home',
      child: (context) => HomeView(),
      transition: TransitionType.fadeIn,
    );
    r.child(
      '/about',
      child: (context) => const AboutView(),
    );
  }
}
