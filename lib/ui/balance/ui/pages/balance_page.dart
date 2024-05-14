import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quantwealth/injectable.dart';
import 'package:quantwealth/ui/balance/cubit/balance_cubit.dart';
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
    return BlocBuilder<BalanceCubit, BalanceState>(
      bloc: getIt<BalanceCubit>()..onStart(),
      builder: (context, state) {
        return BalanceView(
          assets: state.assets,
          onAddFunds: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.white,
              builder: (_) => AddFundsSheet(),
            );
          },
        );
      },
    );
  }
}
