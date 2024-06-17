import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quantwealth/injectable.dart';
import 'package:quantwealth/ui/balance/cubit/balance_cubit.dart';
import 'package:quantwealth/ui/balance/ui/views/portfolio_view.dart';

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
  void initState() {
    super.initState();
    getIt<BalanceCubit>().onStart();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<BalanceCubit, BalanceState>(
      bloc: getIt<BalanceCubit>(),
      builder: (_, state) => PortfolioView(),
    );
  }
}
