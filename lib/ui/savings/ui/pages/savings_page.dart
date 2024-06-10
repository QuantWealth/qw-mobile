import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quantwealth/app/extensions.dart';
import 'package:quantwealth/injectable.dart';
import 'package:quantwealth/ui/auth/cubit/auth_cubit.dart';
import 'package:quantwealth/ui/common/add_funds_sheet.dart';
import 'package:quantwealth/ui/common/tx_sign_sheet.dart';
import 'package:quantwealth/ui/profile/cubit/profile_cubit.dart';
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
              child: CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            );
          case RequestStatus.failure:
            return Center(child: Text(state.error ?? 'An error occurred'));
          default:
            break;
        }

        return BlocListener<TxCubit, TxState>(
          bloc: getIt<TxCubit>(),
          listener: (ctx, txState) {
            final profileState = getIt<ProfileCubit>().state;
            if (txState.status == TxStatus.pending) {
              switch (profileState.loginType) {
                case LoginType.walletConnect:
                  getIt<TxCubit>().sendTxApproval(
                    tx: txState.tx!,
                    strategy: state.selectedSavingsOption!.apiName,
                  );
                  break;

                case LoginType.web3Auth:
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Color(0xFF121212),
                    builder: (_) => TxSignSheet(
                      tx: txState.tx!,
                      onSign: () {
                        context.navigator.pop();
                        showDialog(
                          context: context,
                          builder: (_) => SuccessDialog(),
                        );
                      },
                    ),
                  );
                  break;
                default:
                  break;
              }
            }

            if (txState.status == TxStatus.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Task Created!'),
                  backgroundColor: Colors.green,
                ),
              );
            }
          },
          child: SavingsView(
            onAmountChanged: (val) => getIt<SavingsCubit>().amountChanged(val),
            onLevelChanged: (val) {},
            onSelectSavings: (op) {
              getIt<SavingsCubit>().switchOption(op);
              InvestConfirmPopup.show(
                context,
                title: '${op.name} details',
                description:
                    'You are about to invest in the ${op.name.toLowerCase()} savings option. Are you sure you want to continue?',
                onContinue: () {
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
          ),
        );
      },
    );
  }
}
