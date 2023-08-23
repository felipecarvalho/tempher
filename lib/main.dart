import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tempher/core/helpers/helpers.dart';
import 'package:tempher/core/theme/theme.dart';
import 'package:tempher/app/root.dart';
import 'package:tempher/app/module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Activate stay awake mode on devices
  DebugMode.stayAwake();

  // Load device language code
  EasyLocalization.logger.printer = (object, {level, name, stackTrace}) {
    DebugMode.showOnLog('$object', className: EasyLocalization);
  };
  await EasyLocalization.ensureInitialized();

  // Package platform information
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();

  // Device preferences
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: ThemeColors.transparent),
  );

  runApp(
    EasyLocalization(
      useOnlyLangCode: true,
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      supportedLocales: const [
        Locale('pt'),
        Locale('en'),
        Locale('es'),
      ],
      child: ModularApp(
        module: AppModule(),
        child: Root(
          appName: packageInfo.appName,
        ),
      ),
    ),
  );
}
