import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quantwealth/app/extensions.dart';
import 'package:quantwealth/app/theme/theme.dart';
import 'package:quantwealth/ui/common/widgets/base_scaffold.dart';
import 'package:quantwealth/ui/home/ui/pages/invest_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final selectedItems = <int>[];

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      floatingActionButton: Visibility(
        visible: selectedItems.isNotEmpty,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SizedBox(
            width: double.infinity,
            child: FloatingActionButton.extended(
              backgroundColor: Colors.blueGrey.withOpacity(.8),
              onPressed: () => context.navigator.push(
                InvestPage(selectedItems: selectedItems)
                    .route(material: Platform.isAndroid),
              ),
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
              label: Text(
                'Invest',
                style: fontSB(18, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(
            color: white.withOpacity(0.2),
            height: 1,
            thickness: 1.0,
          );
        },
        itemCount: stakingAssets.length,
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        itemBuilder: (context, index) {
          final asset = stakingAssets[index];

          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(
                left: 28.0,
                right: 30.0,
                bottom: 20,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Investments',
                      style: fontB(18),
                    ),
                  ),
                  SizedBox(
                    width: 75,
                    child: Text(
                      'APR',
                      style: fontB(18),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  SizedBox(
                    width: 75,
                    child: Text(
                      'RF',
                      style: fontB(18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          }

          return InkWell(
            onTap: () => setState(() {
              if (selectedItems.contains(index)) {
                selectedItems.remove(index);
                return;
              } else {
                selectedItems.add(index);
              }
            }),
            child: ListTile(
              selected: selectedItems.contains(index),
              selectedTileColor: Colors.lightGreen.withOpacity(.4),
              title: Text(
                asset.name,
                style: fontSB(18),
              ),
              subtitle: Text(
                asset.symbol,
                style: fontR(16),
              ),
              // leading: Checkbox(
              //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              //   activeColor: Colors.white,
              //   checkColor: Colors.black,
              //   value: selectedItems.contains(index),
              //   onChanged: (value) => setState(() {
              //     if (value == false) {
              //       selectedItems.remove(index);
              //       return;
              //     } else {
              //       selectedItems.add(index);
              //     }
              //   }),
              // ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 70,
                        child: Text(
                          '${asset.apy}%',
                          style: fontB(18),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 70,
                        child: Text(
                          '${asset.riskProfile}%',
                          style: fontB(18),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
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
