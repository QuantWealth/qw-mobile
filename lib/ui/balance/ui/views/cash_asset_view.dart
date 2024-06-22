import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:quantwealth/app/extensions.dart';
import 'package:quantwealth/app/theme/theme.dart';
import 'package:quantwealth/ui/balance/ui/widgets/asset_list_tile.dart';
import 'package:quantwealth/ui/common/add_funds_sheet.dart';
import 'package:quantwealth/ui/common/widgets/base_scaffold.dart';

class CashAssetView extends StatelessWidget {
  final FakeAsset asset;

  const CashAssetView({
    super.key,
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      extendBodyBehindAppBar: false,
      onBack: () => context.navigator.pop(),
      titleWidget: Text(
        asset.title,
        style: fontSB(20),
      ),
      suffix: [
        TextButton(
          onPressed: () {},
          child: Text(
            'Manage',
            style: fontSB(18, color: Colors.deepPurpleAccent),
          ),
        ),
      ],
      isCenterTitle: true,
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 18.0),
            title: Countup(
              begin: 0,
              end: double.parse(asset.amount),
              prefix: '\$',
              separator: ',',
              duration: const Duration(seconds: 1),
              style: fontB(40),
            ),
            subtitle: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Available balance',
                  style: fontR(14, color: Colors.grey),
                ),
                SizedBox(width: 4),
                InkWell(
                  onTap: () {
                    // TODO: Show info dialog
                  },
                  child: Icon(
                    Icons.info_outline,
                    color: Colors.white.withOpacity(.5),
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 18.0),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: RichText(
                text: TextSpan(
                  text: '\$968.31',
                  style: fontR(16, color: Colors.green),
                  children: [
                    TextSpan(
                      text: ' interest earned',
                      style: fontR(16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            subtitle: RichText(
              text: TextSpan(
                text: '5.38%',
                style: fontR(16, color: Colors.green),
                children: [
                  TextSpan(
                    text: ' current APY',
                    style: fontR(16, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 24,
            thickness: 1,
            color: Colors.grey.withOpacity(.5),
          ),
          AssetHistoryListView(),
          SizedBox(height: 80),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          width: double.infinity,
          child: FloatingActionButton(
            backgroundColor: Colors.deepPurple,
            onPressed: () => AddFundsSheet().show(context),
            child: Text(
              'Transfer Money',
              style: fontSB(18),
            ),
          ),
        ),
      ),
    );
  }
}

class AssetHistoryListView extends StatelessWidget {
  const AssetHistoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Text(
            'SEPTEMBER',
            style: fontR(12, color: Colors.grey),
          ),
        ),
        ...List.generate(
          20,
          (index) => ListTile(
            onTap: () {},
            contentPadding: EdgeInsets.symmetric(horizontal: 18.0),
            title: Text(
              index.isEven ? 'Transfer to invest' : 'Interest earned in Sept',
              style: fontM(16),
            ),
            subtitle: Text(
              'Monday, Sep ${index + 1}',
              style: fontR(14, color: Colors.grey),
            ),
            trailing: Text(
              index.isEven ? '\$${index + 1}00.00' : '+\$${index + 1}00.00',
              style: fontR(
                16,
                color: index.isEven ? null : Colors.green,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
