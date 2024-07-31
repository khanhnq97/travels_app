import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/mockito.dart';
import 'package:travels_app/domain/models/search_result.dart';
import 'package:travels_app/main.dart' as app;
import 'package:travels_app/domain/models/user.dart';

import '../test/mock_classes.mocks.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  final mockLoginWithEmail = MockLoginWithEmail();
  final mockSearchFlightsAndHotels = MockSearchFlightsAndHotels();
  final mockBookServices = MockBookServices();
  final mockPayWithCreditCard = MockPayWithCreditCard();

  group('end-to-end test', () {
    setUp(() {
      when(mockLoginWithEmail.call(any, any)).thenAnswer((_) async => const User(id: '1', name: 'Test User', email: 'test@example.com'));
      when(mockSearchFlightsAndHotels.call(any, any, any)).thenAnswer((_) async => const SearchResult(flights: [], hotels: []));
      when(mockBookServices.call(any)).thenAnswer((_) async {});
      when(mockPayWithCreditCard.call(any)).thenAnswer((_) async {});
    });

    testWidgets('Complete flow from login to booking', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Ensure we are on the login screen
      expect(find.text('Login'), findsOneWidget);

      // Enter login credentials
      await tester.enterText(find.byKey(const Key('emailField')), 'test@example.com');
      await tester.enterText(find.byKey(const Key('passwordField')), 'password123');
      await tester.tap(find.byKey(const Key('loginButton')));
      await tester.pumpAndSettle();

      // Ensure we navigated to the search screen
      expect(find.text('Search'), findsOneWidget);

      // Enter search details
      await tester.enterText(find.byKey(const Key('flightFromField')), 'New York');
      await tester.enterText(find.byKey(const Key('flightToField')), 'Paris');
      await tester.enterText(find.byKey(const Key('flightDateField')), '2023-10-21');
      await tester.enterText(find.byKey(const Key('hotelLocationField')), 'Paris');
      await tester.tap(find.byKey(const Key('searchButton')));
      await tester.pumpAndSettle();

      // Ensure we navigated to the search results screen
      expect(find.text('Search Results'), findsOneWidget);

      // Select a flight result
      await tester.tap(find.byType(ListTile).first);
      await tester.pumpAndSettle();

      // Ensure we navigated to the service details screen
      expect(find.text('Service Details'), findsOneWidget);

      // Book the service
      await tester.tap(find.byKey(const Key('bookNowButton')));
      await tester.pumpAndSettle();

      // Ensure we navigated to the booking confirmation screen
      expect(find.text('Booking Confirmation'), findsOneWidget);
    });

    testWidgets('Test all screen navigation and back flow', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      expect(find.text('Login'), findsOneWidget);

      await tester.enterText(find.byKey(const Key('emailField')), 'test@example.com');
      await tester.enterText(find.byKey(const Key('passwordField')), 'password123');
      await tester.tap(find.byKey(const Key('loginButton')));
      await tester.pumpAndSettle();

      expect(find.text('Search'), findsOneWidget);

      await tester.tap(find.byKey(const Key('profileButton')));
      await tester.pumpAndSettle();

      expect(find.text('User Profile'), findsOneWidget);

      await tester.tap(find.byKey(const Key('logoutButton')));
      await tester.pumpAndSettle();

      expect(find.text('Login'), findsOneWidget);
    });
  });
}
