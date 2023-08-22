import 'package:flutter/material.dart';
import 'package:tempher/core/theme/theme.dart';

class ThemeDefault {
  static Function get light {
    return (BuildContext context) {
      return ThemeData(
        useMaterial3: true,
        fontFamily: ThemeTextStyle.fontfamily,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      );
    };
  }
}
