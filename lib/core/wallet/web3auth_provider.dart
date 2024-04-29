import 'package:quantwealth/core/wallet/wallet_provider.dart';
import 'package:web3dart/web3dart.dart';

class Web3AuthProvider implements WalletProvider {
  @override
  Future<Wallet?> getWallet() {
    // TODO: implement getWallet
    throw UnimplementedError();
  }

  @override
  Future<void> init() {
    // TODO: implement init
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
