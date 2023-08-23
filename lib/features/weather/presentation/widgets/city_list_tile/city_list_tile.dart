// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:tempher/core/theme/theme.dart';
import 'package:tempher/core/widgets/widgets.dart';

class CityListTile extends StatelessWidget {
  final String cityName;
  final String maxTemp;
  final String minTemp;
  final String currentTemp;

  const CityListTile({
    super.key,
    required this.cityName,
    required this.maxTemp,
    required this.minTemp,
    required this.currentTemp,
  });

  @override
  Widget build(BuildContext context) {
    return CardOutlined(
      hasChevron: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cityName,
                  style: ThemeTextStyle.display2,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                ),
                Text(
                  '${tr('temp.max')}: $maxTemp° ${tr('temp.min')}: $minTemp°',
                  style: ThemeTextStyle.body,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                '$currentTemp°',
                style: ThemeTextStyle.headline2,
              ),
              const Icon(LucideIcons.chevronRight)
            ],
          ),
        ],
      ),
    );
  }
}
