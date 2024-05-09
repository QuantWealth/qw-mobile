import 'package:flutter/material.dart';
import 'package:quantwealth/ui/balance/ui/views/balance_view.dart';
import 'package:quantwealth/ui/common/add_funds_sheet.dart';

class BalancePage extends StatefulWidget {
  const BalancePage({super.key});

  @override
  State<BalancePage> createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BalanceView(
      onAddFunds: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.white,
          builder: (_) => AddFundsSheet(),
        );
      },
    );
  }
}
