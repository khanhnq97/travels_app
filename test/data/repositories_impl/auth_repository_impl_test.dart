import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:travels_app/data/repositories_impl/auth_repository_impl.dart';
import 'package:travels_app/domain/models/user.dart';
import '../../mock_classes.mocks.dart';

void main() {
  late AuthRepositoryImpl authRepository;
  late MockAuthDataSource mockAuthDataSource;

  setUp(() {
    mockAuthDataSource = MockAuthDataSource();
    authRepository = AuthRepositoryImpl(mockAuthDataSource);
  });

  test('login with email success', () async {
    const user = User(id: '1', name: 'Test User', email: 'test@example.com');
    when(mockAuthDataSource.loginWithEmail('test@example.com', 'password')).thenAnswer((_) async => user);

    final result = await authRepository.loginWithEmail('test@example.com', 'password');

    expect(result, user);
    verify(mockAuthDataSource.loginWithEmail('test@example.com', 'password')).called(1);
  });

  test('login with social media success', () async {
    const user = User(id: '2', name: 'Social User', email: 'social@example.com');
    when(mockAuthDataSource.loginWithSocialMedia()).thenAnswer((_) async => user);

    final result = await authRepository.loginWithSocialMedia();

    expect(result, user);
    verify(mockAuthDataSource.loginWithSocialMedia()).called(1);
  });

  test('login with SSO success', () async {
    const user = User(id: '3', name: 'SSO User', email: 'sso@example.com');
    when(mockAuthDataSource.loginWithSSO()).thenAnswer((_) async => user);

    final result = await authRepository.loginWithSSO();

    expect(result, user);
    verify(mockAuthDataSource.loginWithSSO()).called(1);
  });

  test('logout success', () async {
    when(mockAuthDataSource.logout()).thenAnswer((_) async {});

    await authRepository.logout();

    verify(mockAuthDataSource.logout()).called(1);
  });
}
