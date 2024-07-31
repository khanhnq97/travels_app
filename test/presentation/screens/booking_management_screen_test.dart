import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:travels_app/presentation/screens/booking_management_screen.dart';
import 'package:travels_app/providers/booking_provider.dart';
import 'package:travels_app/domain/models/booking.dart';

import '../../mock_classes.mocks.dart';

class MockBookingNotifier extends BookingNotifier {
  MockBookingNotifier(BookingState state, {required super.bookServices, required super.manageBooking}) {
    this.state = state;
  }
}

void main() {
  final mockBookServices = MockBookServices();
  final mockManageBooking = MockManageBooking();

  testWidgets('BookingManagementScreen displays loading indicator', (WidgetTester tester) async {
    final container = ProviderContainer(
      overrides: [
        bookingProvider.overrideWith((ref) {
          return MockBookingNotifier(const BookingState(isLoading: true), bookServices: mockBookServices, manageBooking: mockManageBooking);
        }),
      ],
    );

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(home: BookingManagementScreen()),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('BookingManagementScreen displays error message', (WidgetTester tester) async {
    final container = ProviderContainer(
      overrides: [
        bookingProvider.overrideWith((ref) {
          return MockBookingNotifier(const BookingState(errorMessage: 'Failed to load bookings'),
              bookServices: mockBookServices, manageBooking: mockManageBooking);
        }),
      ],
    );

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(home: BookingManagementScreen()),
      ),
    );

    expect(find.text('Failed to load bookings'), findsOneWidget);
  });

  testWidgets('BookingManagementScreen displays bookings', (WidgetTester tester) async {
    final booking = Booking(id: '1', userId: 'user1', serviceId: 'service1', bookingDate: DateTime.now());
    final container = ProviderContainer(
      overrides: [
        bookingProvider.overrideWith((ref) {
          return MockBookingNotifier(BookingState(booking: booking), bookServices: mockBookServices, manageBooking: mockManageBooking);
        }),
      ],
    );

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(home: BookingManagementScreen()),
      ),
    );

    expect(find.text('Booking ID: 1'), findsOneWidget);
  });
}
