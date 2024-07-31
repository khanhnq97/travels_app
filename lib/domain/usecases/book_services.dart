import 'package:travels_app/domain/models/booking.dart';
import 'package:travels_app/domain/repositories/booking_repository.dart';

class BookServices {
  final BookingRepository repository;

  BookServices(this.repository);

  Future<void> call(Booking booking) {
    return repository.createBooking(booking);
  }
}
