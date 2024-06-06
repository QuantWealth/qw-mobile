import 'package:flutter/material.dart';
import 'package:quantwealth/app/theme/theme.dart';
import 'package:quantwealth/ui/balance/infrastructure/datasource/asset_dto.dart';

class AssetsListView extends StatelessWidget {
  final List<AssetDto> assets;
  final Function(AssetDto)? onClick;

  const AssetsListView({
    super.key,
    required this.assets,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: assets.length,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      itemBuilder: (_, index) => AssetListTile(
        asset: assets[index],
        onClick: onClick,
      ),
    );
  }
}

class AssetListTile extends StatelessWidget {
  final AssetDto asset;
  final Function(AssetDto)? onClick;

  const AssetListTile({
    super.key,
    required this.asset,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 20,
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: Image.network(asset.logoUrls.tokenLogo),
      ),
      title: Text(
        asset.name,
        style: fontSB(18),
      ),
      subtitle: Text(
        '${asset.balance.substring(0, 1)} ${asset.symbol}',
        style: fontR(14),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '\$${asset.balance.substring(0, 3)}',
            style: fontSB(18),
          ),
          Text(
            '${10}%',
            style: fontR(14, color: Colors.greenAccent),
          ),
        ],
      ),
      onTap: () => onClick?.call(asset),
    );
  }
}
