import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travels_app/domain/usecases/login_with_email.dart';
import 'package:travels_app/domain/usecases/logout.dart';
import 'package:travels_app/domain/models/user.dart';
import 'package:travels_app/data/data_sources/auth_data_source.dart';
import 'package:travels_app/data/repositories_impl/auth_repository_impl.dart';

class AuthState {
  final bool isLoading;
  final User? user;
  final String? errorMessage;

  const AuthState({
    this.isLoading = false,
    this.user,
    this.errorMessage,
  });
}

class AuthNotifier extends StateNotifier<AuthState> {
  final LoginWithEmail loginWithEmail;
  final Logout logout;

  AuthNotifier({required this.loginWithEmail, required this.logout}) : super(const AuthState());

  Future<void> login(String email, String password) async {
    state = const AuthState(isLoading: true);
    try {
      final user = await loginWithEmail(email, password);
      if (user != null) {
        state = AuthState(user: user);
      } else {
        state = const AuthState(errorMessage: 'Login failed');
      }
    } catch (e) {
      state = AuthState(errorMessage: e.toString());
    }
  }

  Future<void> logoutUser() async {
    await logout();
    state = const AuthState();
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authDataSource = AuthDataSourceImpl();
  final authRepository = AuthRepositoryImpl(authDataSource);
  final loginWithEmail = LoginWithEmail(authRepository);
  final logout = Logout(authRepository);
  return AuthNotifier(loginWithEmail: loginWithEmail, logout: logout);
});
