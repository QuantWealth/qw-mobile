import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quantwealth/injectable.dart';
import 'package:quantwealth/ui/savings/cubit/savings_cubit.dart';
import 'package:quantwealth/ui/savings/ui/views/savings_view.dart';

class SavingsPage extends StatefulWidget {
  const SavingsPage({super.key});

  @override
  State<SavingsPage> createState() => _SavingsPageState();
}

class _SavingsPageState extends State<SavingsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocBuilder<SavingsCubit, SavingsState>(
      bloc: getIt<SavingsCubit>()..onStart(),
      builder: (context, state) {
        return SavingsView(
          onAmountChanged: (val) {},
          onLevelChanged: (val) {},
          onSelectSavings: (op) => getIt<SavingsCubit>().switchOption(op),
          onInvest: () {},
          savings: state.savingOptions,
          selectedSavings: state.selectedSavingsOption,
        );
      },
    );
  }
}
