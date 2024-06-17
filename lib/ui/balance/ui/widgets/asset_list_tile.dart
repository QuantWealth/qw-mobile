import 'package:flutter/material.dart';
import 'package:quantwealth/app/theme/theme.dart';

class StockAssetListTile extends StatelessWidget {
  final FakeAsset asset;
  final Function()? onTap;

  const StockAssetListTile({
    super.key,
    required this.asset,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap?.call(),
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.grey.withOpacity(.3),
        child: Icon(
          asset.icon,
          size: 25,
          color: Colors.grey,
        ),
      ),
      title: Text(
        asset.title,
        style: fontM(17),
      ),
      subtitle: Text(
        asset.subtitle,
        style: fontM(14, color: Colors.grey),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '\$${asset.amount}',
            style: fontSB(17),
          ),
          Text(
            'Just now',
            style: fontR(14, color: Colors.grey.withOpacity(.7)),
          ),
        ],
      ),
    );
  }
}

class FakeAsset {
  final String title;
  final String subtitle;
  final String amount;
  final IconData icon;

  const FakeAsset({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.icon,
  });
}
