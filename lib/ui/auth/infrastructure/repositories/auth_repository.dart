import 'package:injectable/injectable.dart';
import 'package:quantwealth/ui/auth/infrastructure/datasources/auth_local_datasource.dart';
import 'package:quantwealth/ui/auth/infrastructure/datasources/auth_remote_datasource.dart';

@singleton
class AuthRepository {
  final AuthRemoteDatasource _remoteDatasource;
  final AuthLocalDatasource _localDatasource;

  const AuthRepository(this._remoteDatasource, this._localDatasource);

  Future<void> login(String value) => _localDatasource.savePrivateKey(value);
}
