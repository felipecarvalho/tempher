// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:tempher/core/theme/theme.dart';

enum SpacingType { small, medium, large, extraLarge, maxExtraLarge }

class Spacing extends StatelessWidget {
  final bool isRow;
  final SpacingType spacing;
  late double width;
  late double height;

  Spacing({
    super.key,
    this.isRow = false,
    this.spacing = SpacingType.medium,
  });

  @override
  Widget build(BuildContext context) {
    switch (spacing) {
      case SpacingType.small:
        width = ThemeMetrics.paddingSm;
        height = ThemeMetrics.paddingSm;
      case SpacingType.medium:
        width = ThemeMetrics.paddingMd;
        height = ThemeMetrics.paddingMd;
      case SpacingType.large:
        width = ThemeMetrics.paddingLg;
        height = ThemeMetrics.paddingLg;
      case SpacingType.extraLarge:
        width = ThemeMetrics.paddingXl;
        height = ThemeMetrics.paddingXl;
      case SpacingType.maxExtraLarge:
        width = ThemeMetrics.paddingXxl;
        height = ThemeMetrics.paddingXxl;
      default:
        width = ThemeMetrics.paddingMd;
        height = ThemeMetrics.paddingMd;
    }

    return SizedBox(
      width: isRow ? width : 0,
      height: !isRow ? height : 0,
    );
  }
}
