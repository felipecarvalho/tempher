import 'package:flutter/material.dart';
import 'package:tempher/core/theme/theme.dart';

sealed class ThemeFontWeight {
  static FontWeight bold = FontWeight.w700;
  static FontWeight semiBold = FontWeight.w600;
  static FontWeight medium = FontWeight.w400;
}

sealed class ThemeFontSize {
  static double minimum = 12;
  static double small = 14;
  static double normal = 17;
  static double medium = 22;
  static double large = 37;
  static double maximum = 64;
}

class ThemeTextStyle {
  static String fontfamily = 'Gilroy';
  static double letterSpacing = 0;

  static TextStyle body = TextStyle(
    letterSpacing: letterSpacing,
    fontSize: ThemeFontSize.small,
    fontWeight: ThemeFontWeight.semiBold,
    color: ThemeColors.primaryHigh,
  );

  static TextStyle body2 = TextStyle(
    letterSpacing: letterSpacing,
    fontSize: ThemeFontSize.small,
    fontWeight: ThemeFontWeight.semiBold,
    color: ThemeColors.secondary,
  );

  static TextStyle caption = TextStyle(
    letterSpacing: letterSpacing,
    fontSize: ThemeFontSize.minimum,
    fontWeight: ThemeFontWeight.semiBold,
    color: ThemeColors.primaryHigh,
  );

  static TextStyle display = TextStyle(
    letterSpacing: letterSpacing,
    fontSize: ThemeFontSize.normal,
    fontWeight: ThemeFontWeight.semiBold,
    color: ThemeColors.primaryHigh,
  );

  static TextStyle display2 = TextStyle(
    letterSpacing: letterSpacing,
    fontSize: ThemeFontSize.normal,
    fontWeight: ThemeFontWeight.semiBold,
    color: ThemeColors.secondary,
  );

  static TextStyle headline = TextStyle(
    letterSpacing: letterSpacing,
    fontSize: ThemeFontSize.maximum,
    fontWeight: ThemeFontWeight.semiBold,
    color: ThemeColors.secondary,
  );

  static TextStyle headline2 = TextStyle(
    letterSpacing: letterSpacing,
    fontSize: ThemeFontSize.large,
    fontWeight: ThemeFontWeight.semiBold,
    color: ThemeColors.secondary,
  );

  static TextStyle headline3 = TextStyle(
    letterSpacing: letterSpacing,
    fontSize: ThemeFontSize.medium,
    fontWeight: ThemeFontWeight.semiBold,
    color: ThemeColors.secondary,
  );

  static TextStyle inputHint = TextStyle(
    letterSpacing: letterSpacing,
    fontSize: ThemeFontSize.normal,
    fontWeight: ThemeFontWeight.medium,
    color: ThemeColors.primaryHigh,
  );

  static TextStyle inputValue = TextStyle(
    letterSpacing: letterSpacing,
    fontSize: ThemeFontSize.normal,
    fontWeight: ThemeFontWeight.medium,
    color: ThemeColors.secondary,
  );

  static TextStyle submitLabel = TextStyle(
    letterSpacing: letterSpacing,
    fontSize: ThemeFontSize.normal,
    fontWeight: ThemeFontWeight.bold,
    color: ThemeColors.secondary,
  );
}
