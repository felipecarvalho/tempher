import 'package:flutter/material.dart';
import 'package:tempher/core/helpers/helpers.dart';
import 'package:tempher/core/theme/theme.dart';
import 'package:tempher/core/widgets/widgets.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HomeView extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  HomeView({super.key});

  submitSearch() {
    DebugMode.showOnLog(searchController.text);
  }

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
                    child: SearchTextField(
                      controller: searchController,
                      onSubmit: () => submitSearch(),
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
