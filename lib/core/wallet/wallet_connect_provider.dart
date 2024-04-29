import 'package:web3modal_flutter/web3modal_flutter.dart';
import 'wallet_provider.dart';

class WalletConnectProvider implements WalletProvider {
  @override
  Future<void> init() async {}

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
