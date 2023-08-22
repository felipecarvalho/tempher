import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tempher/core/helpers/helpers.dart';
import 'package:tempher/core/theme/theme.dart';
import 'package:tempher/core/widgets/widgets.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HomeView extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: ThemeMetrics.appBarPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Logo(isLight: false, isVertical: true),
              NavigationIcon(
                icon: LucideIcons.helpCircle,
                onTap: () => Navigate.push('/about'),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: ThemeMetrics.defaultPadding),
        child: Column(
          children: [
            Spacing(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: ThemeMetrics.inputPaddingHorizontal),
                    decoration: BoxDecoration(
                      color: ThemeColors.primaryLow,
                      borderRadius: BorderRadius.all(Radius.circular(ThemeMetrics.borderRadius)),
                    ),
                    child: TextField(
                      style: ThemeTextStyle.inputValue,
                      cursorColor: ThemeColors.primaryHigh,
                      controller: searchController,
                      onSubmitted: (value) {
                        searchController.text = value;
                        print(searchController.text);
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(ThemeMetrics.inputPaddingVertical),
                        prefixIcon: Icon(LucideIcons.search, color: ThemeColors.primaryHigh),
                        hintStyle: ThemeTextStyle.inputHint,
                        hintText: tr('home.inputHint'),
                        border: InputBorder.none,
                        suffix: GestureDetector(
                          child: Text('Ok', style: ThemeTextStyle.submitLabel),
                          onTap: () {
                            print(searchController.text);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
