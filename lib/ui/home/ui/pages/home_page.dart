import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quantwealth/app/strings.dart';
import 'package:quantwealth/app/theme/theme.dart';
import 'package:quantwealth/injectable.dart';
import 'package:quantwealth/ui/auth/cubit/auth_cubit.dart';
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
      title: _activePage.title,
      titleWidget: _activePage == PageItems.balance
          ? Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Stack(
                children: [
                  Center(
                    child: SizedBox(
                      height: 100.0,
                      width: 100.0,
                      child: SvgPicture.asset('assets/icons/logo.svg'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () => getIt<AuthCubit>().logout(),
                      icon: Icon(Icons.logout_outlined),
                      color: white,
                    ),
                  )
                ],
              ),
            )
          : null,
      suffix: _activePage != PageItems.balance
          ? IconButton(
              onPressed: () => getIt<AuthCubit>().logout(),
              icon: Icon(Icons.logout_outlined),
              color: white,
            )
          : null,
      isCenterTitle: true,
      body: PageView(
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
        height: 96.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          boxShadow: [
            BoxShadow(
              color: gray900.withOpacity(0.1),
              offset: Offset(0, 4),
              blurRadius: 8.0,
            ),
          ],
          color: bottomBarGrey,
        ),
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
                            ? Colors.grey.withOpacity(.9)
                            : white,
                        e.icon,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
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
  investments,
  profile;

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
      case PageItems.profile:
        return 'assets/icons/bottomFour.svg';
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
      case PageItems.profile:
        return 'assets/icons/bottomFourActive.svg';
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
      case PageItems.profile:
        return 'Degens';
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
      case 4:
        return PageItems.profile;
    }
    return null;
  }
}
