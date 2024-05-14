import 'package:flutter/material.dart';
import 'package:quantwealth/app/strings.dart';
import 'package:quantwealth/app/theme/theme.dart';
import 'package:quantwealth/ui/balance/infrastructure/datasource/asset_dto.dart';
import 'package:quantwealth/ui/balance/ui/widgets/assets_listview.dart';
import 'package:quantwealth/ui/common/widgets/default_button.dart';

class BalanceView extends StatelessWidget {
  final VoidCallback onAddFunds;
  final List<AssetDto> assets;

  const BalanceView({
    super.key,
    required this.onAddFunds,
    required this.assets,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(height: 48.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Column(
                children: [
                  Text(
                    'Overall Balance',
                    style: TextStyle(
                      fontSize: 20,
                      color: white,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '\$1000',
                    style: TextStyle(
                      fontSize: 64,
                      color: white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 32.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultButton(
                onPressed: onAddFunds,
                label: Strings.labelAddFunds,
                fontSize: 22.0,
                padding: const EdgeInsets.symmetric(
                  vertical: 18.0,
                  horizontal: 80.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 48.0),
          TabBar(
            labelStyle: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
            labelColor: white,
            unselectedLabelColor: gray700,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: white,
            dividerColor: Colors.transparent,
            tabs: const [
              Tab(text: 'Assets'),
              Tab(text: 'Investments'),
            ],
          ),
          SizedBox(
            height: 400, // You can adjust this as per your requirement
            child: TabBarView(
              children: [
                AssetsListView(
                  assets: assets,
                  onClick: (asset) {},
                ),
                Icon(
                  Icons.directions_transit,
                  color: Colors.amber,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}