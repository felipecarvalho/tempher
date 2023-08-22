import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tempher/core/helpers/helpers.dart';
import 'package:tempher/core/theme/theme.dart';
import 'package:tempher/core/widgets/widgets.dart';

class Splash extends StatefulWidget {
  final String? redirectPath;

  const Splash({
    super.key,
    this.redirectPath,
  });

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool loaded = false;

  @override
  void initState() {
    Timer(const Duration(), () => setState(() => loaded = !loaded));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: [
          Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              color: ThemeColors.secondary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacing(spacing: SpacingType.large),
                  const Logo(),
                  Spacing(),
                  FutureBuilder(
                    future: Future.delayed(
                      const Duration(seconds: 5),
                      () => Navigate.pushWithoutPop(widget.redirectPath!),
                    ),
                    builder: (_, __) => CircularProgressIndicator(
                      color: ThemeColors.primary,
                      strokeWidth: ThemeMetrics.loadingStroke,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedContainer(
            curve: Curves.fastOutSlowIn,
            duration: const Duration(seconds: 2),
            color: loaded ? ThemeColors.transparent : ThemeColors.secondary,
          ),
        ],
      ),
    );
  }
}
