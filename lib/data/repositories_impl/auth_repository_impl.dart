import 'package:travels_app/domain/models/user.dart';
import 'package:travels_app/domain/repositories/auth_repository.dart';
import 'package:travels_app/data/data_sources/auth_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<User?> loginWithEmail(String email, String password) {
    return dataSource.loginWithEmail(email, password);
  }

  @override
  Future<User?> loginWithSocialMedia() {
    return dataSource.loginWithSocialMedia();
  }

  @override
  Future<User?> loginWithSSO() {
    return dataSource.loginWithSSO();
  }

  @override
  Future<void> logout() {
    return dataSource.logout();
  }
}
