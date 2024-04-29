import 'package:web3dart/credentials.dart';

abstract class WalletProvider {
  Future<void> init();

  Future<Wallet?> getWallet();

  Future<void> signMsg({
    required String msg,
  });

  Future<void> signTx({
    required String tx,
  });

  Future<void> sendTx({
    required String tx,
  });

  Future<void> personalSign(
    String msg,
    // callback enter here
    Function(String) onSign,
    Function(String) onSendTx,
  );
}
