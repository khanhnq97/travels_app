import 'package:travels_app/domain/repositories/booking_repository.dart';
import 'package:travels_app/domain/models/booking.dart';

class ManageBooking {
  final BookingRepository repository;

  ManageBooking(this.repository);

  Future<void> update(Booking booking) {
    return repository.updateBooking(booking);
  }

  Future<void> delete(String bookingId) {
    return repository.deleteBooking(bookingId);
  }
}