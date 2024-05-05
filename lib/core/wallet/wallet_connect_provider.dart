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

  static WalletConnectProvider? _instance;

  WalletConnectProvider._();

  factory WalletConnectProvider() {
    _instance ??= WalletConnectProvider._();
    return _instance!;
  }

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
    await _setupListeners();
  }

  Future<void> _setupListeners() async {
    service.onModalConnect.subscribe((args) {
      log('Modal connect: $args', name: 'WcProvider');
    });

    service.onModalDisconnect.subscribe((args) {
      log('Modal disconnect: $args', name: 'WcProvider');
    });

    service.onModalError.subscribe((args) {
      log('Modal error: $args', name: 'WcProvider');
    });

    service.onSessionExpireEvent.subscribe((args) {
      log('Session expire: $args', name: 'WcProvider');
    });

    service.onSessionUpdateEvent.subscribe((args) {
      log('Session update: $args', name: 'WcProvider');
    });

    service.onSessionEventEvent.subscribe((args) {
      log('Session event: $args', name: 'WcProvider');
    });
  }

  void cleanupListeners() {
    service.onModalConnect.unsubscribeAll();
    service.onModalDisconnect.unsubscribeAll();
    service.onModalError.unsubscribeAll();
    service.onSessionExpireEvent.unsubscribeAll();
    service.onSessionUpdateEvent.unsubscribeAll();
    service.onSessionEventEvent.unsubscribeAll();
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
