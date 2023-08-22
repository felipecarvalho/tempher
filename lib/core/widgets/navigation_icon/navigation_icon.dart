import 'package:flutter/material.dart';
import 'package:tempher/core/theme/metrics/metrics.dart';

class NavigationIcon extends StatelessWidget {
  final Function()? onTap;
  final IconData? icon;

  const NavigationIcon({
    super.key,
    this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 36,
        height: 36,
        child: Icon(icon, size: ThemeMetrics.iconSize),
      ),
    );
  }
}
