import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tempher/core/theme/theme.dart';

class Root extends StatelessWidget {
  final String appName;
  final String initialRoute = '/';

  const Root({
    super.key,
    required this.appName,
  }) : super();

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(initialRoute);
    return MaterialApp.router(
      title: appName,
      theme: ThemeDefault.light(context),
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      routerConfig: Modular.routerConfig,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
    );
  }
}
