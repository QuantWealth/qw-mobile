import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quantwealth/core/wallet/wallet_provider.dart';
import 'package:web3auth_flutter/enums.dart';
import 'package:web3auth_flutter/input.dart';
import 'package:web3auth_flutter/web3auth_flutter.dart';
import 'package:web3dart/web3dart.dart';

class Web3AuthProvider implements WalletProvider {
  @override
  Future<void> init() async {
    late final Uri redirectUrl;

    if (Platform.isAndroid) {
      redirectUrl = Uri.parse('quantwealth://app.quant.wealth/auth');
    } else {
      redirectUrl = Uri.parse('app.quant.wealth://auth');
    }

    await Web3AuthFlutter.init(Web3AuthOptions(
      clientId:
          'f8d9099851dbc368664024afdee62e79a3c592058b4bc521c406af3c118eb2fd',
      network: Network.sapphire_mainnet,
      redirectUrl: redirectUrl,
    ));

    await Web3AuthFlutter.initialize();
  }

  @override
  Future<Wallet?> getWallet() {
    // TODO: implement getWallet
    throw UnimplementedError();
  }

  @override
  Future<void> personalSign(
    String msg,
    Function(String p1) onSign,
    Function(String p1) onSendTx,
  ) {
    // TODO: implement personalSign
    throw UnimplementedError();
  }

  @override
  Future<void> sendTx({
    required String tx,
  }) {
    // TODO: implement sendTx
    throw UnimplementedError();
  }

  @override
  Future<void> signMsg({
    required String msg,
  }) {
    // TODO: implement signMsg
    throw UnimplementedError();
  }

  @override
  Future<void> signTx({
    required String tx,
  }) {
    // TODO: implement signTx
    throw UnimplementedError();
  }
}
