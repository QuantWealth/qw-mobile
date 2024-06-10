import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:quantwealth/core/wallet/wallet_connect_provider.dart';
import 'package:quantwealth/core/wallet/web3auth_provider.dart';
import 'package:quantwealth/ui/auth/cubit/auth_cubit.dart';
import 'package:quantwealth/ui/profile/cubit/profile_cubit.dart';
import 'package:quantwealth/ui/savings/infrastructure/datasource/approved_tx_dto.dart';
import 'package:quantwealth/ui/savings/infrastructure/repository/savings_repository.dart';

part 'tx_state.dart';
part 'tx_cubit.freezed.dart';

@lazySingleton
class TxCubit extends Cubit<TxState> {
  final SavingsRepository _repository;
  final Web3AuthProvider _web3AuthProvider;
  final WalletConnectProvider _walletConnectProvider;
  final ProfileCubit _profileCubit;

  TxCubit({
    required SavingsRepository repository,
    required ProfileCubit profileCubit,
  })  : _repository = repository,
        _profileCubit = profileCubit,
        _web3AuthProvider = Web3AuthProvider(),
        _walletConnectProvider = WalletConnectProvider(),
        super(TxState.initial());

  Future<void> sendApprove({
    required int amount,
  }) async {
    final amt = (amount * pow(10, 6)).toInt();
    final approvedTx = await _repository.createApprove(
      walletAddress: _profileCubit.state.scwAddress,
      amount: amt,
    );

    approvedTx.fold(
      (tx) => emit(TxState.loading(amount: amt, tx: tx)),
      (error) => emit(TxState.failure(error.toString())),
    );
  }

  Future<void> sendTxApproval({
    required ApprovedTxDto tx,
    required String strategy,
  }) async {
    late String sig;
    final profile = _profileCubit.state;

    switch (profile.loginType) {
      case LoginType.walletConnect:
        _walletConnectProvider.service.launchConnectedWallet();
        sig = await _walletConnectProvider.signTypedDataV4(tx.typedData);
        break;

      case LoginType.web3Auth:
        sig = await _web3AuthProvider.signTypedDataV4(tx.typedData);
        break;

      default:
        break;
    }

    final confirmedTxResp = await _repository.sendApprove(
      walletAddress: profile.scwAddress,
      signerAddress: profile.walletAddress,
      metaTransaction: tx.txData,
      amount: state.amount!,
      strategy: strategy.toUpperCase(),
      signature: sig,
    );

    confirmedTxResp.fold(
      (tx) {
        debugPrint(tx.toString());
        emit(TxState.success(state.amount!));
      },
      (error) => emit(TxState.failure(error.toString())),
    );
  }
}
