import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:travels_app/domain/models/user.dart';
import 'package:travels_app/presentation/screens/login_screen.dart';
import 'package:travels_app/providers/auth_provider.dart';

import '../../mock_classes.mocks.dart';

class MockAuthNotifier extends AuthNotifier {
  MockAuthNotifier(AuthState state, {required super.loginWithEmail, required super.logout}) {
    this.state = state;
  }
}

void main() {
  final mockLoginWithEmail = MockLoginWithEmail();
  final mockLogout = MockLogout();

  testWidgets('LoginScreen shows error message', (WidgetTester tester) async {
    final container = ProviderContainer(
      overrides: [
        authProvider.overrideWith((ref) {
          return MockAuthNotifier(const AuthState(errorMessage: 'Login failed'), loginWithEmail: mockLoginWithEmail, logout: mockLogout);
        }),
      ],
    );

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(home: LoginScreen()),
      ),
    );

    expect(find.text('Login failed'), findsOneWidget);
  });

  testWidgets('LoginScreen calls login method', (WidgetTester tester) async {
    final container = ProviderContainer(
      overrides: [
        authProvider.overrideWith((ref) {
          return AuthNotifier(loginWithEmail: mockLoginWithEmail, logout: mockLogout);
        }),
      ],
    );

    when(mockLoginWithEmail.call(any, any)).thenAnswer((_) async => const User(id: '1', name: 'Test User', email: 'test@example.com'));

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(home: LoginScreen()),
      ),
    );

    await tester.enterText(find.byKey(const Key('emailField')), 'test@example.com');
    await tester.enterText(find.byKey(const Key('passwordField')), 'password');
    await tester.tap(find.byKey(const Key('loginButton')));
    await tester.pump();

    verify(mockLoginWithEmail('test@example.com', 'password')).called(1);
  });
}
