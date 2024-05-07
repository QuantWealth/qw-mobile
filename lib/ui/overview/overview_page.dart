import 'package:flutter/material.dart';
import 'package:quantwealth/ui/overview/balance_page.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({super.key});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) => setState(() {
          currentPageIndex = index;
        }),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.stop_circle_outlined),
            label: 'Balance',
          ),
          NavigationDestination(
            icon: Icon(Icons.wallet),
            label: 'Wallet',
          ),
        ],
      ),
      body: SafeArea(
        child: <Widget>[
          BalancePage(),
          WalletPage(),
        ][currentPageIndex],
      ),
    );
  }
}

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0),
            child: Text(
              'Savings',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          DividerTextButton(
            title: 'Flexible',
            subtitle: '18%',
            onPressed: () {},
          ),
          SizedBox(height: 20),
          DividerTextButton(
            title: 'Fixed',
            subtitle: '18%',
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

class DividerTextButton extends StatelessWidget {
  final String title, subtitle;
  final Function()? onPressed;

  const DividerTextButton({
    super.key,
    required this.title,
    required this.subtitle,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 70.0),
      child: InkWell(
        onTap: onPressed,
        child: Column(
          children: [
            Divider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 22),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
