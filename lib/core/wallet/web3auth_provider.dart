import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hex/hex.dart';
import 'package:quantwealth/core/env/app_env.dart';
import 'package:quantwealth/core/wallet/wallet_connect_provider.dart';
import 'package:quantwealth/core/wallet/wallet_provider.dart';
import 'package:walletconnect_flutter_v2/walletconnect_flutter_v2.dart';
import 'package:web3auth_flutter/enums.dart';
import 'package:web3auth_flutter/input.dart';
import 'package:web3auth_flutter/output.dart';
import 'package:web3auth_flutter/web3auth_flutter.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;

class Web3AuthProvider implements WalletProvider {
  late final Web3Client client;
  late final Credentials creds;

  late final bool Function(String msg) onSignMsg;

  static Web3AuthProvider? _instance;

  Web3AuthProvider._();

  factory Web3AuthProvider() {
    _instance ??= Web3AuthProvider._();
    return _instance!;
  }

  @override
  Future<void> init() async {
    late final Uri redirectUrl;

    if (Platform.isAndroid) {
      redirectUrl = Uri.parse('quantwealth://xyz.quantwealth.app/auth');
    } else {
      redirectUrl = Uri.parse('xyz.quantwealth.app://auth');
    }

    await Web3AuthFlutter.init(Web3AuthOptions(
      clientId: appEnv.w3ClientId,
      network: Network.sapphire_devnet,
      redirectUrl: redirectUrl,
    ));

    await Web3AuthFlutter.initialize();

    client = Web3Client(
      'https://eth.llamarpc.com',
      http.Client(),
    );
  }

  Future<void> logout() async {
    await Web3AuthFlutter.logout();
  }

  Future<String?> loginWithGoogle() async {
    final Web3AuthResponse response = await Web3AuthFlutter.login(
      LoginParams(loginProvider: Provider.google),
    );

    log('Response: $response', name: 'Web3AuthProvider');

    return response.privKey;
  }

  Future<String?> loginWithApple() async {
    final Web3AuthResponse response = await Web3AuthFlutter.login(
      LoginParams(loginProvider: Provider.apple),
    );

    log('Response: $response', name: 'Web3AuthProvider');

    return response.privKey;
  }

  Future<String?> loginWithEmail() async {
    final Web3AuthResponse response = await Web3AuthFlutter.login(
      LoginParams(loginProvider: Provider.email_passwordless),
    );

    log('Response: $response', name: 'Web3AuthProvider');

    return response.privKey;
  }

  @override
  Future<EvmWallet?> getWallet() async {
    final privKey = await Web3AuthFlutter.getPrivKey();
    creds = EthPrivateKey.fromHex(privKey);
    final address = creds.address.hex;

    final balance = await client.getBalance(creds.address);
    final chainId = await client.getChainId();

    log('Address: $address');
    log('Balance: $balance');
    log('Chain ID: $chainId');

    return EvmWallet(
      address: address,
      chainId: chainId.toInt(),
      balance: balance.toString(),
    );
  }

  @override
  Future<String> personalSign(String msg) async {
    final privKey = await Web3AuthFlutter.getPrivKey();
    creds = EthPrivateKey.fromHex(privKey);

    final signed = creds.signPersonalMessageToUint8List(
      Uint8List.fromList(msg.codeUnits),
    );

    final result = HEX.encode(signed);

    log('Signature: $result', name: 'Web3AuthProvider');

    return result;
  }

  @override
  Future<void> sendRawTx({required String tx}) async {
    final result = await client.sendRawTransaction(
      Uint8List.fromList(tx.codeUnits),
    );

    log('Tx hash: $result', name: 'Web3AuthProvider');
  }

  @override
  Future<void> sendTx({required Transaction tx}) async {
    final result = await client.sendTransaction(creds, tx);

    log('Tx hash: $result', name: 'Web3AuthProvider');
  }

  @override
  Future<void> signMsg({required String msg}) {
    // TODO: implement signMsg
    throw UnimplementedError();
  }

  @override
  Future<void> signTx({
    required String address,
    required String data,
  }) async {
    final result = await client.signTransaction(
      creds,
      Transaction(
        from: creds.address,
        maxGas: 100000,
        to: EthereumAddress.fromHex(address),
        data: Uint8List.fromList(data.codeUnits),
      ),
    );

    log('Tx hash: $result', name: 'Web3AuthProvider');
  }
}
