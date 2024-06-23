import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quantwealth/app/extensions.dart';
import 'package:quantwealth/app/theme/theme.dart';
import 'package:quantwealth/ui/common/widgets/base_scaffold.dart';
import 'package:quantwealth/ui/home/ui/pages/invest_page.dart';
import 'package:quantwealth/ui/home/ui/pages/strategy_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final selectedItems = <int>[];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BaseScaffold(
        extendBodyBehindAppBar: false,
        navBarColor: bottomBarGrey,
        titleWidget: Text(
          'Marketplace',
          style: fontSB(24),
        ),
        isCenterTitle: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SizedBox(
          width: double.infinity,
          child: FloatingActionButton.extended(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            enableFeedback: true,
            backgroundColor: Colors.black,
            onPressed: () => selectedItems.isNotEmpty
                ? context.navigator.push(
                    InvestPage(selectedItems: selectedItems)
                        .route(material: Platform.isAndroid),
                  )
                : null,
            icon: Text(
              'Invest',
              style: fontSB(20, color: Colors.white),
            ),
            label: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SearchBar(
                  hintText: 'Search for strategies, assets, etc.',
                  side: WidgetStatePropertyAll(
                    BorderSide(
                      color: Colors.white,
                      width: .3,
                    ),
                  ),
                  backgroundColor: WidgetStatePropertyAll(
                    Colors.grey.withOpacity(.05),
                  ),
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                  trailing: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.filter_list,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.white,
                dividerColor: Colors.transparent,
                tabs: [
                  Tab(
                    child: Text(
                      'Custom',
                      style: fontM(20, color: Colors.white),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Degens',
                      style: fontM(20, color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Expanded(
                child: TabBarView(
                  children: [
                    _customList(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: StrategyPage(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60.0)
            ],
          ),
        ),
      ),
    );
  }

  ListView _customList() {
    return ListView.separated(
      itemCount: stakingAssets.length,
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 20.0),
      separatorBuilder: (context, index) => Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
      ),
      itemBuilder: (context, index) {
        final asset = stakingAssets[index];

        return GestureDetector(
          onTap: () => setState(() {
            if (selectedItems.contains(index)) {
              selectedItems.remove(index);
              return;
            } else {
              selectedItems.add(index);
            }
          }),
          child: AnimatedContainer(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.grey,
                width: selectedItems.contains(index) ? 3 : .5,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
            duration: const Duration(milliseconds: 200),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ListTile(
                  title: Text(
                    asset.name,
                    style: fontB(18),
                  ),
                  subtitle: Text(
                    asset.symbol,
                    style: fontR(16),
                  ),
                  trailing: Icon(
                    Icons.stacked_line_chart_rounded,
                    color: Colors.green,
                    size: 30,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text(
                          'APR',
                          style: fontR(13, color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                        subtitle: Text(
                          '${asset.apy}%',
                          style: fontB(16, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          'Risk Profile',
                          style: fontR(13, color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                        subtitle: Text(
                          '${asset.riskProfile}%',
                          style: fontB(16, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class StakingAsset {
  final String name;
  final String symbol;
  final double apy;
  final double riskProfile;

  StakingAsset({
    required this.name,
    required this.symbol,
    required this.apy,
    required this.riskProfile,
  });
}

final stakingAssets = [
  StakingAsset(
    name: 'Mantle Staked ETH',
    symbol: 'METH',
    apy: 23.0,
    riskProfile: 95.0,
  ),
  StakingAsset(
    name: 'Convex Finance',
    symbol: 'CVX',
    apy: 22.0,
    riskProfile: 90.0,
  ),
  StakingAsset(
    name: 'JustStables',
    symbol: 'JST',
    apy: 21.0,
    riskProfile: 88.0,
  ),
  StakingAsset(
    name: 'Marinade',
    symbol: 'MNDE',
    apy: 20.0,
    riskProfile: 85.0,
  ),
  StakingAsset(
    name: 'Magpie Ecosystem',
    symbol: 'MAGPIE',
    apy: 19.0,
    riskProfile: 82.0,
  ),
  StakingAsset(
    name: 'Solv Protocol',
    symbol: 'SOLV',
    apy: 18.0,
    riskProfile: 80.0,
  ),
  StakingAsset(
    name: 'Kamino',
    symbol: 'KAM',
    apy: 17.0,
    riskProfile: 78.0,
  ),
  StakingAsset(
    name: 'Kelp DAO',
    symbol: 'KELP',
    apy: 16.0,
    riskProfile: 75.0,
  ),
  StakingAsset(
    name: 'Balancer',
    symbol: 'BAL',
    apy: 15.0,
    riskProfile: 73.0,
  ),
  StakingAsset(
    name: 'SubseaProtocol',
    symbol: 'SUB',
    apy: 14.0,
    riskProfile: 70.0,
  ),
  StakingAsset(
    name: 'Frax Finance',
    symbol: 'FRAX',
    apy: 13.0,
    riskProfile: 68.0,
  ),
  StakingAsset(
    name: 'Sanctum',
    symbol: 'SNCT',
    apy: 12.0,
    riskProfile: 65.0,
  ),
  StakingAsset(
    name: 'Raydium',
    symbol: 'RAY',
    apy: 11.0,
    riskProfile: 63.0,
  ),
  StakingAsset(
    name: 'AILayer',
    symbol: 'AIL',
    apy: 10.0,
    riskProfile: 60.0,
  ),
];
