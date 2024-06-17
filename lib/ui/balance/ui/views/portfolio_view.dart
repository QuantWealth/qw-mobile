import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:quantwealth/app/constants.dart';
import 'package:quantwealth/app/theme/theme.dart';
import 'package:quantwealth/ui/balance/ui/widgets/asset_list_tile.dart';

class PortfolioView extends StatelessWidget {
  const PortfolioView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: BouncingScrollPhysics(),
      children: [
        SizedBox(height: 48.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    '\$138,943',
                    style: fontB(30),
                  ),
                  subtitle: Text(
                    '\$1.3M net worth at 25',
                    style: fontM(18, color: Colors.grey),
                  ),
                ),
              ),
              Text(
                'Goals',
                style: fontB(
                  18,
                  color: Colors.deepPurpleAccent,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            height: 200,
            child: PortfolioChart(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Today',
                style: fontM(
                  14,
                  color: Colors.grey,
                ),
              ),
              Text(
                'Age 80',
                style: fontM(
                  14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        Divider(
          color: Colors.grey.withOpacity(.8),
          thickness: 0.5,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Cash',
                  style: fontB(18),
                ),
              ),
              Text(
                '\$12,400.43',
                style: fontSB(18),
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemCount: fakeAssets.length,
          itemBuilder: (_, i) => StockAssetListTile(asset: fakeAssets[i]),
        ),
        SizedBox(height: 12),
        Divider(
          color: Colors.grey.withOpacity(.8),
          thickness: 0.5,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Investments',
                  style: fontB(18),
                ),
              ),
              Text(
                '\$127.940.63',
                style: fontSB(18),
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemCount: fakeAssets.length,
          itemBuilder: (_, i) => StockAssetListTile(asset: fakeAssets[i]),
        ),
        SizedBox(height: 12),
        Divider(
          color: Colors.grey.withOpacity(.8),
          thickness: 0.5,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Strategies',
                  style: fontB(18),
                ),
              ),
              Text(
                '\$207,040.63',
                style: fontSB(18),
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemCount: fakeAssets.length,
          itemBuilder: (_, i) => StockAssetListTile(asset: fakeAssets[i]),
        ),
        SizedBox(height: 12),
      ],
    );
  }
}

class PortfolioChart extends StatelessWidget {
  const PortfolioChart({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        lineTouchData: LineTouchData(
          handleBuiltInTouches: true,
          touchTooltipData: LineTouchTooltipData(
            getTooltipColor: (touchedSpot) => Colors.white,
            getTooltipItems: (touchedSpots) => touchedSpots
                .map((touchedSpot) => LineTooltipItem(
                      '\$${touchedSpot.y.toStringAsFixed(2)}',
                      TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
                .toList(),
          ),
          getTouchedSpotIndicator: (barData, spotIndexes) => spotIndexes
              .map((index) => TouchedSpotIndicatorData(
                    FlLine(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                    FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) =>
                          FlDotCirclePainter(
                        radius: 6,
                        color: Colors.white,
                        strokeWidth: 0,
                      ),
                    ),
                  ))
              .toList(),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: List.generate(
              10,
              (i) => FlSpot(i.toDouble(), i * i.toDouble()),
            ),
            isCurved: true,
            gradient: LinearGradient(
              colors: const [
                Colors.redAccent,
                Colors.purpleAccent,
                Colors.blueAccent,
              ],
            ),
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}
