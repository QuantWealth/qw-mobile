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

    return BlocConsumer<SavingsCubit, SavingsState>(
      bloc: getIt<SavingsCubit>()..onStart(),
      listener: (_, state) {
        if (state.investmentStatus == RequestStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Investment successful'),
              backgroundColor: Colors.green,
            ),
          );
        }
      },
      builder: (context, state) {
        switch (state.status) {
          case RequestStatus.loading:
            return const Center(child: CircularProgressIndicator.adaptive());
          case RequestStatus.failure:
            return Center(child: Text(state.error ?? 'An error occurred'));
          default:
            break;
        }

        return SavingsView(
          onAmountChanged: (val) => getIt<SavingsCubit>().amountChanged(val),
          onLevelChanged: (val) {},
          onSelectSavings: (op) => getIt<SavingsCubit>().switchOption(op),
          onInvest: () => getIt<SavingsCubit>().invest(),
          savings: state.savingOptions,
          selectedSavings: state.selectedSavingsOption,
        );
      },
    );
  }
}
