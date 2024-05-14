import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthLocalDatasource {
  final FlutterSecureStorage _secureStorage;

  AuthLocalDatasource(this._secureStorage);

  Future<void> savePrivateKey(String value) =>
      _secureStorage.write(key: 'privateKey', value: value);

  Future<String?> getPrivateKey(String value) =>
      _secureStorage.read(key: 'privateKey');
}
