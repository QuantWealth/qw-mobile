import 'package:web3modal_flutter/web3modal_flutter.dart';
import 'wallet_provider.dart';

class Wallet {
  final String address;
  final String chainId;
  final String networkId;
  final String balance;

  Wallet({
    required this.address,
    required this.chainId,
    required this.networkId,
    required this.balance,
  });
}

class WalletConnectProvider implements WalletProvider {
  late W3MService service;

  @override
  Future<void> init() async {
    service = W3MService(
      projectId: '68c90d8869309432fa62984b6a792a16',
      logLevel: LogLevel.debug,
      metadata: const PairingMetadata(
        name: 'QuantWealth',
        description: 'A wealth management app for the future',
        url: 'https://www.quantwealth.xyz/',
        icons: [
          'https://assets-global.website-files.com/662d92f3b61e3145e2bed763/662d9354f6e91759c318062b_logo%20export%20v2-p-500.png'
        ],
        redirect: Redirect(
          native: 'quantwealth://',
          universal: 'https://www.quantwealth.xyz/',
        ),
      ),
    );

    await service.init();
  }

  @override
  Future<Wallet?> getWallet() {
    service.selectedWallet;
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
