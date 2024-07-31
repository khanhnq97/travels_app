import 'package:travels_app/domain/models/user.dart';

abstract class AuthRepository {
  Future<User?> loginWithEmail(String email, String password);

  Future<User?> loginWithSocialMedia();

  Future<User?> loginWithSSO();

  Future<void> logout();
}
