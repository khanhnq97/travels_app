import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:travels_app/domain/models/user.dart';
import 'package:travels_app/providers/auth_provider.dart';

import '../mock_classes.mocks.dart';

void main() {
  late MockLoginWithEmail mockLoginWithEmail;
  late MockLogout mockLogout;
  late AuthNotifier authNotifier;

  setUp(() {
    mockLoginWithEmail = MockLoginWithEmail();
    mockLogout = MockLogout();
    authNotifier = AuthNotifier(
      loginWithEmail: mockLoginWithEmail,
      logout: mockLogout,
    );
  });

  test('login with email success', () async {
    const user = User(id: '1', name: 'Test User', email: 'test@example.com');
    when(mockLoginWithEmail.call('test@example.com', 'password')).thenAnswer((_) async => user);

    await authNotifier.login('test@example.com', 'password');

    expect(authNotifier.state.user, user);
    verify(mockLoginWithEmail.call('test@example.com', 'password')).called(1);
  });

  test('login with email failure', () async {
    when(mockLoginWithEmail.call('test@example.com', 'wrong_password')).thenAnswer((_) async => null);

    await authNotifier.login('test@example.com', 'wrong_password');

    expect(authNotifier.state.errorMessage, 'Login failed');
  });

  test('logout success', () async {
    when(mockLogout.call()).thenAnswer((_) async {});

    await authNotifier.logoutUser();

    expect(authNotifier.state.user, null);
    verify(mockLogout.call()).called(1);
  });
}
