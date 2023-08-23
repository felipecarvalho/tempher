import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:tempher/core/theme/theme.dart';
import 'package:tempher/core/widgets/widgets.dart';
import 'package:tempher/features/weather_details/domain/entities/weather_entry.dart';

class WeatherDetailsCard extends StatelessWidget {
  final WeatherEntry entry;

  const WeatherDetailsCard(this.entry, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: ThemeMetrics.defaultPadding),
      child: CardOutlined(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        toBeginningOfSentenceCase(DateFormat('EEE').format(entry.date).toString())!,
                        style: ThemeTextStyle.display2,
                        overflow: TextOverflow.fade,
                        softWrap: false,
                      ),
                      Text(
                        toBeginningOfSentenceCase(entry.description.toString())!,
                        style: ThemeTextStyle.caption,
                        overflow: TextOverflow.fade,
                        softWrap: false,
                      ),
                    ],
                  ),
                ),
                Text(
                  '${tr('temp.max')}: ${entry.maxTemp}° ${tr('temp.min')}: ${entry.minTemp}°',
                  style: ThemeTextStyle.display2,
                ),
              ],
            ),
            // Text('${entry.currentTemp}°'),
          ],
        ),
      ),
    );
  }
}
