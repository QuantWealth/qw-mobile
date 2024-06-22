import 'package:collection/collection.dart';
import 'package:countup/countup.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:quantwealth/app/extensions.dart';
import 'package:quantwealth/app/theme/theme.dart';
import 'package:quantwealth/ui/balance/ui/widgets/asset_list_tile.dart';
import 'package:quantwealth/ui/common/widgets/base_scaffold.dart';

class InvestmentAssetView extends StatelessWidget {
  final FakeAsset asset;

  const InvestmentAssetView({
    super.key,
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      extendBodyBehindAppBar: false,
      onBack: () => context.navigator.pop(),
      titleWidget: Text(
        asset.title,
        style: fontSB(20),
      ),
      suffix: [
        TextButton(
          onPressed: () {},
          child: Text(
            'Manage',
            style: fontSB(18, color: Colors.deepPurpleAccent),
          ),
        ),
      ],
      isCenterTitle: true,
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Countup(
              begin: 0,
              end: double.parse(asset.amount),
              prefix: '\$',
              separator: ',',
              duration: const Duration(seconds: 1),
              style: fontB(40),
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 18.0),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '▲ 1.7% today',
                    style: fontR(16, color: Colors.grey),
                  ),
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: '▲ 40.0%',
                          style: fontR(16, color: Colors.green),
                          children: [
                            TextSpan(
                              text: ' all time',
                              style: fontR(16, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 4),
                      InkWell(
                        onTap: () {
                          // TODO: Show info dialog
                        },
                        child: Icon(
                          Icons.info_outline,
                          color: Colors.white.withOpacity(.5),
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            subtitle: Row(
              children: [
                RichText(
                  text: TextSpan(
                    text: '\$565',
                    style: fontR(16, color: Colors.green),
                    children: [
                      TextSpan(
                        text: ' estimated taxes saved',
                        style: fontR(16, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 4),
                InkWell(
                  onTap: () {
                    // TODO: Show info dialog
                  },
                  child: Icon(
                    Icons.info_outline,
                    color: Colors.white.withOpacity(.5),
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: context.mediaQuery.size.height * 0.20,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: List.generate(
                        10,
                        (i) => FlSpot(i.toDouble(), i * i.toDouble()),
                      ),
                      isCurved: true,
                      color: Colors.white70,
                      barWidth: 2,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ChartFilters.all
                .mapIndexed(
                  (index, filter) => TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      backgroundColor: index != ChartFilters.all.length - 1
                          ? null
                          : Colors.deepPurple.withOpacity(.3),
                    ),
                    child: Text(
                      filter.name,
                      style: fontSB(14, color: Colors.white.withOpacity(.6)),
                    ),
                  ),
                )
                .toList(),
          ),
          ...List.generate(
            10,
            (index) {
              return ListTile(
                onTap: () {},
                contentPadding: const EdgeInsets.symmetric(horizontal: 18.0),
                title: Text(
                  index.isEven ? 'Flexi' : 'Savings',
                  style: fontSB(16),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'XYZ Inc.',
                      style: fontR(14, color: Colors.grey),
                    ),
                    Text(
                      '▲ 1.$index% today',
                      style: fontR(14, color: Colors.green),
                    ),
                  ],
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$3$index,829.32',
                      style: fontR(16),
                    ),
                    Text(
                      '▲ ${index + 1 * 2}.7%',
                      style: fontR(14, color: Colors.green),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

enum ChartFilters {
  ThreeMonths,
  SixMonths,
  OneYear,
  ThreeYears,
  FiveYears,
  AllTime;

  String get name {
    switch (this) {
      case ThreeMonths:
        return '3M';
      case SixMonths:
        return '6M';
      case OneYear:
        return '1Y';
      case ThreeYears:
        return '3Y';
      case FiveYears:
        return '5Y';
      case AllTime:
        return 'ALL';
    }
  }

  static List<ChartFilters> get all => [
        ThreeMonths,
        SixMonths,
        OneYear,
        ThreeYears,
        FiveYears,
        AllTime,
      ];
}
