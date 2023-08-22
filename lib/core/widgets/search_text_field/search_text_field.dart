import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:tempher/core/theme/theme.dart';

class SearchTextField extends StatelessWidget {
  final Function() onSubmit;

  const SearchTextField({
    super.key,
    required this.controller,
    required this.onSubmit,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: ThemeTextStyle.inputValue,
      controller: controller,
      onChanged: (value) => controller.text = value,
      onSubmitted: (_) => onSubmit(),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(ThemeMetrics.inputPaddingVertical),
        prefixIcon: Icon(LucideIcons.search, color: ThemeColors.primaryHigh),
        hintStyle: ThemeTextStyle.inputHint,
        hintText: tr('home.inputHint'),
        border: InputBorder.none,
        suffix: GestureDetector(
          child: Text('Ok', style: ThemeTextStyle.submitLabel),
          onTap: () => onSubmit(),
        ),
      ),
    );
  }
}
