import 'package:travels_app/domain/models/booking.dart';
import 'package:travels_app/domain/repositories/booking_repository.dart';
import 'package:travels_app/data/data_sources/booking_data_source.dart';

class BookingRepositoryImpl implements BookingRepository {
  final BookingDataSource dataSource;

  BookingRepositoryImpl(this.dataSource);

  @override
  Future<Booking?> getBooking(String id) {
    return dataSource.getBooking(id);
  }

  @override
  Future<List<Booking>> getBookingsByUser(String userId) {
    return dataSource.getBookingsByUser(userId);
  }

  @override
  Future<void> createBooking(Booking booking) {
    return dataSource.createBooking(booking);
  }

  @override
  Future<void> updateBooking(Booking booking) {
    return dataSource.updateBooking(booking);
  }

  @override
  Future<void> deleteBooking(String id) {
    return dataSource.deleteBooking(id);
  }
}
