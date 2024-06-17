import 'package:flutter/material.dart';
import 'package:quantwealth/ui/balance/ui/widgets/asset_list_tile.dart';
import 'package:quantwealth/ui/savings/infrastructure/datasource/approved_tx_dto.dart';

abstract class Constants {}

const sampleTxData = ApprovedTxDto(
  typedData:
      '{"types":{"EIP712Domain":[{"type":"uint256","name":"chainId"},{"type":"address","name":"verifyingContract"}],"SafeTx":[{"type":"address","name":"to"},{"type":"uint256","name":"value"},{"type":"bytes","name":"data"},{"type":"uint8","name":"operation"},{"type":"uint256","name":"safeTxGas"},{"type":"uint256","name":"baseGas"},{"type":"uint256","name":"gasPrice"},{"type":"address","name":"gasToken"},{"type":"address","name":"refundReceiver"},{"type":"uint256","name":"nonce"}]},"primaryType":"SafeTx","domain":{"verifyingContract":"0xfb1bffC9d739B8D520DaF37dF666da4C687191EA","chainId":"11155111"},"message":{"to":"0x83A9aE82b26249EC6e01498F5aDf0Ec20fF3Da9C","value":"0","data":"0x095ea7b300000000000000000000000013a1a7e98e0235fcfb034452c13c1b7548fa165100000000000000000000000000000000000000000000000000000000000f4240","operation":0,"safeTxGas":"0","baseGas":"0","gasPrice":"0","gasToken":"0x0000000000000000000000000000000000000000","refundReceiver":"0x0000000000000000000000000000000000000000","nonce":0}}',
  txData: MetaTxData(
    to: '0x83A9aE82b26249EC6e01498F5aDf0Ec20fF3Da9C',
    data:
        '0x095ea7b300000000000000000000000013a1a7e98e0235fcfb034452c13c1b7548fa165100000000000000000000000000000000000000000000000000000000000f4240',
    value: '0',
  ),
);

final fakeAssets = List.generate(2, (index) {
  return FakeAsset(
    title: 'Asset ${index + 1}',
    subtitle: 'Subtitle ${index + 1}',
    amount: (1000 + index * 100).toStringAsFixed(2),
    icon: index.isEven ? Icons.account_balance_wallet : Icons.account_balance,
  );
});

final cashAssets = [
  FakeAsset(
    title: 'Account',
    subtitle: 'Individual',
    amount: '11,400.00',
    icon: Icons.account_balance_wallet,
  ),
  FakeAsset(
    title: 'DCA',
    subtitle: 'Individual',
    amount: '1,000.43',
    icon: Icons.account_balance,
  ),
];
