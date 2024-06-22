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
        children: List<int>.generate(20, (index) => index).map((index) {
          final color = Colors.primaries[index % Colors.primaries.length];

          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: UserPortfolioCard(
              title: 'Uniswap ${index + 1}',
              subtitle: '900 / 900',
              userIconColor: color,
              onTap: () {},
            ),
          );
        }).toList(),
      ),
    );
  }
}

class UserPortfolioCard extends StatelessWidget {
  final String title, subtitle;
  final bool showUserIcon;
  final Color userIconColor, boxShadowColor;
  final Widget? trailing;
  final Function()? onTap;

  const UserPortfolioCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.showUserIcon = true,
    this.userIconColor = Colors.white,
    this.boxShadowColor = Colors.transparent,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: boxShadowColor,
              blurRadius: 0,
            ),
          ],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey, width: .5),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ListTile(
              leading: showUserIcon
                  ? Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 30,
                    )
                  : null,
              title: Text(
                title,
                style: fontB(18),
              ),
              subtitle: Text(
                subtitle,
                style: fontR(16),
              ),
              trailing: trailing ??
                  Icon(
                    Icons.trending_up_outlined,
                    color: Colors.green,
                    size: 30,
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
                      '+255,020.08',
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
                      '+30.89%',
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
                      '\$20,22,090.2',
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
                      '+23.89%',
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
                      '+9.45%',
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
