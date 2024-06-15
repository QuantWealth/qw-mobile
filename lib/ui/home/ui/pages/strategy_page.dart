import 'package:flutter/material.dart';
import 'package:quantwealth/app/theme/theme.dart';

class StrategyPage extends StatefulWidget {
  const StrategyPage({super.key});

  @override
  State<StrategyPage> createState() => _StrategyPageState();
}

class _StrategyPageState extends State<StrategyPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: .0),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: List<int>.generate(20, (index) => index)
            .map((index) => Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: UserPortfolioCard(index: index, onTap: () {}),
                ))
            .toList(),
      ),
    );
  }
}

class UserPortfolioCard extends StatelessWidget {
  final int index;
  final Function()? onTap;

  const UserPortfolioCard({
    super.key,
    required this.index,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = Colors.primaries[index % Colors.primaries.length];

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey, width: .5),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: color,
                radius: 24.0,
                child: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              title: Text(
                'Professional ${index + 1}',
                style: fontB(18),
              ),
              subtitle: Text(
                '900 / 900',
                style: fontR(16),
              ),
              trailing: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Icon(
                  Icons.candlestick_chart,
                  color: index.isEven ? Colors.green : Colors.red,
                  size: 30,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(
                      '7D PnL',
                      style: fontR(13, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Text(
                      '+255,0${index}0.08',
                      style: fontB(16, color: Colors.green),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      '7D ROI',
                      style: fontR(13, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Text(
                      '+3$index.89%',
                      style: fontB(16, color: Colors.green),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(
                      'AUM',
                      style: fontR(13, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Text(
                      '\$20,${index}2,090.2',
                      style: fontSB(14, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      '7D MDD',
                      style: fontR(13, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Text(
                      '+2$index.89%',
                      style: fontSB(14, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      'Sharpe Ratio',
                      style: fontR(13, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Text(
                      '+9.${index}5%',
                      style: fontSB(14, color: Colors.white),
                      textAlign: TextAlign.center,
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
