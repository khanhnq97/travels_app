import 'package:travels_app/domain/repositories/auth_repository.dart';
import 'package:travels_app/domain/models/user.dart';

class LoginWithSSO {
  final AuthRepository repository;

  LoginWithSSO(this.repository);

  Future<User?> call() {
    return repository.loginWithSSO();
  }
}