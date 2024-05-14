import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:quantwealth/core/wallet/wallet_connect_provider.dart';
import 'package:quantwealth/core/wallet/web3auth_provider.dart';
import 'package:quantwealth/ui/savings/cubit/savings_cubit.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  final Web3AuthProvider _web3AuthProvider;
  final WalletConnectProvider _walletConnectProvider;

  W3MService get service => _walletConnectProvider.service;

  AuthCubit()
      : _web3AuthProvider = Web3AuthProvider(),
        _walletConnectProvider = WalletConnectProvider(),
        super(AuthState.initial());

  void onStart() {
    _web3AuthProvider.init();
    _walletConnectProvider.init();
  }

  Future<void> onWalletConnect() async {
    emit(state.copyWith(loginType: LoginType.walletConnect));
  }

  Future<void> onSocialAuth(SocialAuthType authType) async {
    late final String? privKey;

    emit(AuthState.loading().copyWith(
      loginType: LoginType.web3Auth,
    ));

    switch (authType) {
      case SocialAuthType.google:
        privKey = await _web3AuthProvider.loginWithGoogle();
        break;
      case SocialAuthType.apple:
        privKey = await _web3AuthProvider.loginWithApple();
        break;
      case SocialAuthType.email:
        privKey = await _web3AuthProvider.loginWithEmail();
        break;
    }

    log('PrivKey: $privKey', name: 'AuthCubit');

    if (privKey != null) {
      emit(AuthState.success().copyWith(
        loginType: LoginType.web3Auth,
      ));
    } else {
      emit(AuthState.error('Failed to login').copyWith(
        loginType: LoginType.web3Auth,
      ));
    }
  }

  @override
  Future<void> close() {
    _walletConnectProvider.cleanupListeners();
    return super.close();
  }
}

enum SocialAuthType {
  google,
  apple,
  email,
}
