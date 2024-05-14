import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quantwealth/app/strings.dart';
import 'package:quantwealth/app/theme/theme.dart';
import 'package:quantwealth/ui/balance/ui/pages/balance_page.dart';
import 'package:quantwealth/ui/common/widgets/base_scaffold.dart';
import 'package:quantwealth/ui/home/ui/pages/profile_page.dart';
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
              child: SizedBox(
                height: 100.0,
                width: 100.0,
                child: SvgPicture.asset('assets/icons/logo.svg'),
              ),
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
          Placeholder(),
          ProfilePage(),
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
                    icon: Icon(
                      e.icon,
                      size: 32.0,
                      color: _activePage == e
                          ? Colors.white.withOpacity(0.2)
                          : white,
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

enum PageItems {
  balance,
  savings,
  investments,
  profile;

  IconData get icon {
    switch (this) {
      case PageItems.balance:
        return Icons.wallet_outlined;
      case PageItems.savings:
        return Icons.monetization_on_outlined;
      case PageItems.investments:
        return Icons.money_outlined;
      case PageItems.profile:
        return Icons.person_2_outlined;
    }
  }

  String? get title {
    switch (this) {
      case PageItems.balance:
        return null;
      case PageItems.savings:
        return Strings.titleSavings;
      case PageItems.investments:
        return Strings.titleInvestments;
      case PageItems.profile:
        return Strings.titleProfile;
    }
  }

  static PageItems? getActivePage(int index) {
    switch (index) {
      case 0:
        return PageItems.balance;
      case 1:
        return PageItems.savings;
      case 2:
        return PageItems.investments;
      case 3:
        return PageItems.profile;
    }
    return null;
  }
}
