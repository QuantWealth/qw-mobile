import 'dart:developer';

import 'package:web3modal_flutter/web3modal_flutter.dart';
import 'wallet_provider.dart';

class EvmWallet {
  final String address;
  final int chainId;
  final String balance;

  EvmWallet({
    required this.address,
    required this.chainId,
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
      requiredNamespaces: {
        'eip155': W3MNamespace(
          chains: ['eip155:1'],
          methods: [
            'eth_sendTransaction',
            'eth_sign',
            'personal_sign',
            'eth_sendRawTransaction',
          ],
          events: [
            'chainChanged',
            'accountsChanged',
            'message',
            'disconnect',
            'connect',
          ],
        ),
      },
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
  Future<EvmWallet?> getWallet() async {
    final session = service.session;
    if (session == null) {
      return Future.value(null);
    }

    return EvmWallet(
      address: session.address ?? '',
      chainId: int.parse(session.chainId),
      balance: service.chainBalance,
    );
  }

  @override
  Future<String> personalSign(String msg) async {
    if (service.session == null) {
      throw Exception('Wallet not connected');
    }

    if (service.session!.topic == null) {
      throw Exception('Topic not set');
    }

    final result = await service.request(
      topic: service.session!.topic!,
      chainId: 'eip155:${service.session!.chainId}',
      request: SessionRequestParams(
        method: 'personal_sign',
        params: [msg, service.session!.address!],
      ),
    );

    log('Personal sign result: $result', name: 'WcProvider');

    return result;
  }

  @override
  Future<void> sendTx({
    required Transaction tx,
  }) async {
    if (service.session == null) {
      throw Exception('Wallet not connected');
    }

    if (service.session!.topic == null) {
      throw Exception('Topic not set');
    }

    final result = await service.request(
      topic: service.session!.topic!,
      chainId: service.session!.chainId,
      request: SessionRequestParams(
        method: 'eth_sendTransaction',
        params: [tx.toJson()],
      ),
    );

    log('Send tx result: $result', name: 'WcProvider');
  }

  @override
  Future<void> sendRawTx({
    required String tx,
  }) async {
    if (service.session == null) {
      throw Exception('Wallet not connected');
    }

    if (service.session!.topic == null) {
      throw Exception('Topic not set');
    }

    final result = await service.request(
      topic: service.session!.topic!,
      chainId: service.session!.chainId,
      request: SessionRequestParams(
        method: 'eth_sendRawTransaction',
        params: [tx],
      ),
    );

    log('Send raw tx result: $result', name: 'WcProvider');
  }

  @override
  Future<void> signMsg({
    required String msg,
  }) async {}

  @override
  Future<void> signTx({
    required String address,
    required String data,
  }) async {
    if (service.session == null) {
      throw Exception('Wallet not connected');
    }

    if (service.session!.topic == null) {
      throw Exception('Topic not set');
    }

    final result = await service.request(
      topic: service.session!.topic!,
      chainId: service.session!.chainId,
      request: SessionRequestParams(
        method: 'eth_sign',
        params: [address, data],
      ),
    );

    log('Sign tx result: $result', name: 'WcProvider');
  }
}
