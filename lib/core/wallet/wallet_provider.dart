import 'package:quantwealth/core/wallet/wallet_connect_provider.dart';
import 'package:web3dart/web3dart.dart';

abstract class WalletProvider {
  Future<void> init();

  Future<EvmWallet?> getWallet();

  Future<void> signMsg({
    required String msg,
  });

  Future<void> signTx({
    required String address,
    required String data,
  });

  Future<void> sendTx({
    required Transaction tx,
  });

  Future<void> sendRawTx({
    required String tx,
  });

  Future<String> signTypedDataV4(
    String data,
  );

  Future<String> personalSign(
    String msg,
  );
}
