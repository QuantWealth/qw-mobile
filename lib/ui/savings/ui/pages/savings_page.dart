import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quantwealth/injectable.dart';
import 'package:quantwealth/ui/savings/cubit/savings_cubit.dart';
import 'package:quantwealth/ui/savings/cubit/tx_cubit.dart';
import 'package:quantwealth/ui/savings/ui/views/savings_view.dart';
import 'package:quantwealth/ui/savings/ui/widgets/invest_confirm_popup.dart';

class SavingsPage extends StatefulWidget {
  const SavingsPage({super.key});

  @override
  State<SavingsPage> createState() => _SavingsPageState();
}

class _SavingsPageState extends State<SavingsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    getIt<SavingsCubit>().onStart();
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocConsumer<TxCubit, TxState>(
      bloc: getIt<TxCubit>(),
      listener: (ctx, txState) {
        if (txState.status == TxStatus.pending) {
          // showModalBottomSheet(
          //   context: ctx,
          //   builder: (_) => SizedBox(
          //     child: Text(txState.tx.toString()),
          //   ),
          // );
          getIt<TxCubit>().sendTxApproval(tx: txState.tx!);
        }
      },
      builder: (context, state) {
        return BlocConsumer<SavingsCubit, SavingsState>(
          bloc: getIt<SavingsCubit>(),
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
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              case RequestStatus.failure:
                return Center(child: Text(state.error ?? 'An error occurred'));
              default:
                break;
            }

            return SavingsView(
              onAmountChanged: (val) =>
                  getIt<SavingsCubit>().amountChanged(val),
              onLevelChanged: (val) {},
              onSelectSavings: (op) {
                // getIt<SavingsCubit>().switchOption(op);
                InvestConfirmPopup.show(
                  context,
                  title: '${op.name} details',
                  description:
                      'You are about to invest in the ${op.name.toLowerCase()} savings option. Are you sure you want to continue?',
                  onContinue: () {
                    getIt<SavingsCubit>().switchOption(op);
                    // getIt<SavingsCubit>().invest();
                    getIt<TxCubit>().sendApprove(
                      amount: int.tryParse(state.amount) ?? 0,
                    );
                  },
                );
              },
              onInvest: () {},
              savings: state.savingOptions,
              selectedSavings: state.selectedSavingsOption,
              balance: '\$5500',
            );
          },
        );
      },
    );
  }
}
