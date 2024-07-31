import 'package:travels_app/domain/models/user.dart';

abstract class AuthDataSource {
  Future<User?> loginWithEmail(String email, String password);
  Future<User?> loginWithSocialMedia();
  Future<User?> loginWithSSO();
  Future<void> logout();
}

class AuthDataSourceImpl implements AuthDataSource {
  @override
  Future<User?> loginWithEmail(String email, String password) async {
    // Mock implementation
    await Future.delayed(const Duration(seconds: 1));
    return User(id: '1', name: 'Test User', email: email);
  }

  @override
  Future<User?> loginWithSocialMedia() async {
    // Mock implementation
    await Future.delayed(const Duration(seconds: 1));
    return const User(id: '2', name: 'Social User', email: 'social@example.com');
  }

  @override
  Future<User?> loginWithSSO() async {
    // Mock implementation
    await Future.delayed(const Duration(seconds: 1));
    return const User(id: '3', name: 'SSO User', email: 'sso@example.com');
  }

  @override
  Future<void> logout() async {
    // Mock implementation
    await Future.delayed(const Duration(seconds: 1));
  }
}