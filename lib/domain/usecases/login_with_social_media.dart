import 'package:travels_app/domain/models/user.dart';
import 'package:travels_app/domain/repositories/auth_repository.dart';

class LoginWithSocialMedia {
  final AuthRepository repository;

  LoginWithSocialMedia(this.repository);

  Future<User?> call() {
    return repository.loginWithSocialMedia();
  }
}
