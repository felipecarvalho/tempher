import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tempher/core/helpers/helpers.dart';
import 'package:tempher/core/theme/theme.dart';
import 'package:tempher/core/widgets/widgets.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  String? version = '';

  void getVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    setState(() => version = packageInfo.version);
  }

  @override
  void initState() {
    getVersion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            NavigationIcon(
              icon: LucideIcons.arrowLeft,
              onTap: () => Navigate.pop(),
            ),
          ],
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacing(),
            Column(
              children: [
                const Logo(isLight: false),
                Spacing(spacing: SpacingType.small),
                Text('about.version', style: ThemeTextStyle.caption).tr(args: [version!]),
              ],
            ),
            Spacing(),
            Text('about.author', style: ThemeTextStyle.body).tr(),
          ],
        ),
      ),
    );
  }
}
