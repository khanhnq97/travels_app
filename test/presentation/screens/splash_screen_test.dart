import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:travels_app/domain/models/user.dart';
import 'package:travels_app/presentation/screens/splash_screen.dart';
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

  testWidgets('SplashScreen shows LoadingIndicator when loading', (WidgetTester tester) async {
    final container = ProviderContainer(
      overrides: [
        authProvider.overrideWith((ref) {
          return MockAuthNotifier(const AuthState(isLoading: true), loginWithEmail: mockLoginWithEmail, logout: mockLogout);
        }),
      ],
    );

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(home: SplashScreen()),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('SplashScreen navigates to SearchScreen when authenticated', (WidgetTester tester) async {
    const user = User(id: '1', name: 'Test User', email: 'test@example.com');
    final container = ProviderContainer(
      overrides: [
        authProvider.overrideWith((ref) {
          return MockAuthNotifier(const AuthState(user: user), loginWithEmail: mockLoginWithEmail, logout: mockLogout);
        }),
      ],
    );

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(home: SplashScreen()),
      ),
    );

    expect(find.text('Search'), findsOneWidget);
  });

  testWidgets('SplashScreen navigates to LoginScreen when unauthenticated', (WidgetTester tester) async {
    final container = ProviderContainer(
      overrides: [
        authProvider.overrideWith((ref) {
          return MockAuthNotifier(const AuthState(user: null), loginWithEmail: mockLoginWithEmail, logout: mockLogout);
        }),
      ],
    );

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(home: SplashScreen()),
      ),
    );

    expect(find.text('Login'), findsOneWidget);
  });
}
