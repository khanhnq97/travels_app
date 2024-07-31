import 'package:travels_app/domain/models/booking.dart';

abstract class BookingRepository {
  Future<Booking?> getBooking(String id);

  Future<List<Booking>> getBookingsByUser(String userId);

  Future<void> createBooking(Booking booking);

  Future<void> updateBooking(Booking booking);

  Future<void> deleteBooking(String id);
}
