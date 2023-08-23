import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:tempher/core/theme/theme.dart';

class SearchTextField extends StatelessWidget {
  final Function() onSubmit;
  final TextEditingController controller;
  final bool isLoading;

  const SearchTextField({
    super.key,
    required this.controller,
    required this.onSubmit,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: ThemeMetrics.inputPaddingHorizontal),
            decoration: BoxDecoration(
              color: ThemeColors.primaryLow,
              borderRadius: BorderRadius.all(
                Radius.circular(ThemeMetrics.borderRadius),
              ),
            ),
            child: TextField(
              style: ThemeTextStyle.inputValue,
              controller: controller,
              onChanged: (value) => controller.text = value,
              onSubmitted: (_) => onSubmit(),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(ThemeMetrics.inputPaddingVertical),
                prefixIcon: Icon(LucideIcons.search, color: ThemeColors.primaryHigh),
                hintStyle: ThemeTextStyle.inputHint,
                hintText: tr('weather.inputHint'),
                border: InputBorder.none,
                suffix: isLoading
                    ? SizedBox(
                        width: ThemeMetrics.loadingSize,
                        height: ThemeMetrics.loadingSize,
                        child: CircularProgressIndicator(
                          color: ThemeColors.secondary,
                          strokeWidth: ThemeMetrics.loadingStroke,
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.only(left: ThemeMetrics.paddingMd),
                        child: GestureDetector(
                          child: Text('Ok', style: ThemeTextStyle.submitLabel),
                          onTap: () => onSubmit(),
                        ),
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
