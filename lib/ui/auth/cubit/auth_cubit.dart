import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:quantwealth/core/wallet/wallet_connect_provider.dart';
import 'package:quantwealth/core/wallet/web3auth_provider.dart';
import 'package:quantwealth/ui/auth/infrastructure/repository/auth_repository.dart';
import 'package:quantwealth/ui/home/infrastructure/repository/home_repository.dart';
import 'package:quantwealth/ui/profile/cubit/profile_cubit.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  final Web3AuthProvider _web3AuthProvider;
  final WalletConnectProvider _walletConnectProvider;
  final AuthRepository _authRepository;
  final ProfileCubit _profileCubit;

  W3MService get service => _walletConnectProvider.service;

  AuthCubit({
    required AuthRepository authRepository,
    required HomeRepository homeRepository,
    required ProfileCubit profileCubit,
  })  : _web3AuthProvider = Web3AuthProvider(),
        _walletConnectProvider = WalletConnectProvider(),
        _authRepository = authRepository,
        _profileCubit = profileCubit,
        super(AuthState.initial());

  Future<void> onStart() async {
    _web3AuthProvider.init();
    await _walletConnectProvider.init();
    await _walletConnectProvider.setupListeners(
      onConnect: (connect) async {
        log('WalletConnect is connected', name: 'AuthCubit');
        if (connect?.session == null) {
          emit(AuthState.error('WalletConnect error').copyWith(
            loginType: LoginType.none,
          ));
          return;
        }

        _profileCubit.initUser(
          type: LoginType.walletConnect,
          walletAddress: connect!.session.address!,
          provider: connect.session.peer!.metadata.name,
        );
        emit(AuthState.success().copyWith(
          loginType: LoginType.walletConnect,
        ));
      },
      onDisconnect: (disconnect) {
        emit(AuthState.disconnected());
      },
      onError: (error) {
        emit(AuthState.error('WalletConnect error').copyWith(
          loginType: LoginType.none,
        ));
      },
    );

    late String? key;
    try {
      key = await _authRepository.getPrivateKey();
    } catch (e) {
      log('Failed to get private key', name: 'AuthCubit');
      key = null;
    }

    if (_walletConnectProvider.service.isConnected) {
      log('WalletConnect is connected', name: 'AuthCubit');
      _profileCubit.initUser(
        type: LoginType.walletConnect,
        walletAddress: _walletConnectProvider.service.session!.address!,
        provider: _walletConnectProvider.service.session!.peer!.metadata.name,
      );
      emit(AuthState.success().copyWith(
        loginType: LoginType.walletConnect,
      ));
    } else if (key != null) {
      log('Web3Auth is connected', name: 'AuthCubit');
      final creds = EthPrivateKey.fromHex(key);
      _profileCubit.initUser(
        type: LoginType.web3Auth,
        walletAddress: creds.address.hex,
        provider: 'Web3Auth',
      );
      emit(AuthState.success().copyWith(
        loginType: LoginType.web3Auth,
      ));
    } else {
      emit(AuthState.disconnected());
    }
  }

  Future<void> logout() async {
    switch (state.loginType) {
      case LoginType.walletConnect:
        await _walletConnectProvider.logout();
        break;
      case LoginType.web3Auth:
        await _web3AuthProvider.logout();
        break;
      case LoginType.none:
        break;
    }
    await _authRepository.deletePrivateKey();
    emit(AuthState.disconnected());
    await onStart();
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
      await _authRepository.savePrivateKey(privKey);
      final creds = EthPrivateKey.fromHex(privKey);
      _profileCubit.initUser(
        type: LoginType.web3Auth,
        walletAddress: creds.address.hex,
        provider: authType.name,
      );
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
