import 'package:travels_app/domain/models/user.dart';
import 'package:travels_app/domain/repositories/auth_repository.dart';

class LoginWithEmail {
  final AuthRepository repository;

  LoginWithEmail(this.repository);

  Future<User?> call(String email, String password) {
    return repository.loginWithEmail(email, password);
  }
}
