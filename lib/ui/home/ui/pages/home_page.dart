import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quantwealth/app/strings.dart';
import 'package:quantwealth/app/theme/theme.dart';
import 'package:quantwealth/ui/balance/ui/pages/balance_page.dart';
import 'package:quantwealth/ui/common/widgets/base_scaffold.dart';
import 'package:quantwealth/ui/home/ui/pages/search_page.dart';
import 'package:quantwealth/ui/home/ui/pages/staking_page.dart';
import 'package:quantwealth/ui/home/ui/pages/strategy_page.dart';
import 'package:quantwealth/ui/savings/ui/pages/savings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;

  late PageItems _activePage;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    );
    _activePage = PageItems.balance;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      navBarColor: bottomBarGrey,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _activePage = PageItems.getActivePage(index)!;
          });
        },
        children: const [
          BalancePage(),
          SavingsPage(),
          SearchPage(),
          StakingPage(),
          StrategyPage(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0, 4),
              blurRadius: 8.0,
            ),
          ],
          color: bottomBarGrey.withOpacity(.3),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            children: PageItems.values
                .map(
                  (e) => Expanded(
                    child: IconButton(
                      onPressed: () {
                        _pageController.animateToPage(
                          e.index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      icon: SizedBox(
                        height: 32.0,
                        width: 32.0,
                        child: SvgPicture.asset(
                          color: _activePage == e
                              ? white
                              : Colors.grey.withOpacity(.7),
                          e.icon,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class ComingSoon extends StatelessWidget {
  const ComingSoon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Coming Soon...',
        style: TextStyle(
          color: white,
          fontSize: 24.0,
          fontWeight: FontWeight.w500,
          fontFamily: 'GalanoGrotesque',
        ),
      ),
    );
  }
}

enum PageItems {
  balance,
  savings,
  search,
  investments;

  String get icon {
    switch (this) {
      case PageItems.balance:
        return 'assets/icons/bottomOne.svg';
      case PageItems.savings:
        return 'assets/icons/bottomTwo.svg';
      case PageItems.investments:
        return 'assets/icons/bottomThree.svg';
      case PageItems.search:
        return 'assets/icons/search.svg';
    }
  }

  String get activeIcon {
    switch (this) {
      case PageItems.balance:
        return 'assets/icons/bottomOneActive.svg';
      case PageItems.savings:
        return 'assets/icons/bottomTwoActive.svg';
      case PageItems.investments:
        return 'assets/icons/bottomThreeActive.svg';
      case PageItems.search:
        return 'assets/icons/search.svg';
    }
  }

  String? get title {
    switch (this) {
      case PageItems.balance:
        return null;
      case PageItems.savings:
        return Strings.titleSavings;
      case PageItems.investments:
        // return Strings.titleInvestments;
        return 'Staking';
      case PageItems.search:
        return 'Invest';
    }
  }

  static PageItems? getActivePage(int index) {
    switch (index) {
      case 0:
        return PageItems.balance;
      case 1:
        return PageItems.savings;
      case 2:
        return PageItems.search;
      case 3:
        return PageItems.investments;
    }
    return null;
  }
}
