import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tempher/core/theme/theme.dart';

class Logo extends StatelessWidget {
  final bool isLight;
  final bool isVertical;
  final String _image = 'assets/images/logo.svg';
  final String _imageVertical = 'assets/images/logo-vertical.svg';

  const Logo({
    super.key,
    this.isLight = true,
    this.isVertical = false,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      !isVertical ? _image : _imageVertical,
      semanticsLabel: tr('appName'),
      colorFilter: ColorFilter.mode(
        isLight ? ThemeColors.primary : ThemeColors.secondary,
        BlendMode.srcIn,
      ),
    );
  }
}
