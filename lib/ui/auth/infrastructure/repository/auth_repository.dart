import 'package:injectable/injectable.dart';
import 'package:quantwealth/ui/auth/infrastructure/datasources/auth_local_datasource.dart';

@lazySingleton
class AuthRepository {
  final AuthLocalDatasource _authLocalDatasource;

  AuthRepository({
    required AuthLocalDatasource authLocalDatasource,
  }) : _authLocalDatasource = authLocalDatasource;

  Future<void> savePrivateKey(String value) =>
      _authLocalDatasource.savePrivateKey(value);

  Future<void> deletePrivateKey() => _authLocalDatasource.deletePrivateKey();

  Future<String?> getPrivateKey() => _authLocalDatasource.getPrivateKey();
}
