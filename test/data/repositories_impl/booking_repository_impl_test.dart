import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:travels_app/data/repositories_impl/booking_repository_impl.dart';
import 'package:travels_app/domain/models/booking.dart';
import '../../mock_classes.mocks.dart';

void main() {
  late BookingRepositoryImpl bookingRepository;
  late MockBookingDataSource mockBookingDataSource;

  setUp(() {
    mockBookingDataSource = MockBookingDataSource();
    bookingRepository = BookingRepositoryImpl(mockBookingDataSource);
  });

  test('get booking success', () async {
    final booking = Booking(id: '1', userId: 'user1', serviceId: 'service1', bookingDate: DateTime.now());
    when(mockBookingDataSource.getBooking(any)).thenAnswer((_) async => booking);

    final result = await bookingRepository.getBooking('1');

    expect(result, booking);
    verify(mockBookingDataSource.getBooking('1')).called(1);
  });

  test('create booking success', () async {
    final booking = Booking(id: '1', userId: 'user1', serviceId: 'service1', bookingDate: DateTime.now());
    when(mockBookingDataSource.createBooking(any)).thenAnswer((_) async {});

    await bookingRepository.createBooking(booking);

    verify(mockBookingDataSource.createBooking(booking)).called(1);
  });

  test('update booking success', () async {
    final booking = Booking(id: '1', userId: 'user1', serviceId: 'service1', bookingDate: DateTime.now());
    when(mockBookingDataSource.updateBooking(any)).thenAnswer((_) async {});

    await bookingRepository.updateBooking(booking);

    verify(mockBookingDataSource.updateBooking(booking)).called(1);
  });

  test('delete booking success', () async {
    when(mockBookingDataSource.deleteBooking(any)).thenAnswer((_) async {});

    await bookingRepository.deleteBooking('1');

    verify(mockBookingDataSource.deleteBooking('1')).called(1);
  });
}
