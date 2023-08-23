// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tempher/core/theme/theme.dart';

class CardOutlined extends StatelessWidget {
  final Widget? child;
  final bool hasChevron;

  const CardOutlined({
    super.key,
    required this.child,
    this.hasChevron = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.only(
              top: ThemeMetrics.defaultPadding,
              left: ThemeMetrics.defaultPadding,
              bottom: ThemeMetrics.defaultPadding,
              right: hasChevron ? ThemeMetrics.defaultPadding / 2.5 : ThemeMetrics.defaultPadding,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: ThemeColors.primaryLow,
                width: ThemeMetrics.cardStroke,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(ThemeMetrics.borderRadius),
              ),
            ),
            child: child,
          ),
        ),
      ],
    );
  }
}
