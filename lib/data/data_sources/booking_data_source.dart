import 'package:travels_app/domain/models/booking.dart';

abstract class BookingDataSource {
  Future<Booking?> getBooking(String id);
  Future<List<Booking>> getBookingsByUser(String userId);
  Future<void> createBooking(Booking booking);
  Future<void> updateBooking(Booking booking);
  Future<void> deleteBooking(String id);
}

class BookingDataSourceImpl implements BookingDataSource {
  @override
  Future<Booking?> getBooking(String id) async {
    // Mock implementation
    await Future.delayed(const Duration(seconds: 1));
    return Booking(id: id, userId: '1', serviceId: 'flight1', bookingDate: DateTime.now());
  }

  @override
  Future<List<Booking>> getBookingsByUser(String userId) async {
    // Mock implementation
    await Future.delayed(const Duration(seconds: 1));
    return [Booking(id: '1', userId: userId, serviceId: 'flight1', bookingDate: DateTime.now())];
  }

  @override
  Future<void> createBooking(Booking booking) async {
    // Mock implementation
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> updateBooking(Booking booking) async {
    // Mock implementation
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> deleteBooking(String id) async {
    // Mock implementation
    await Future.delayed(const Duration(seconds: 1));
  }
}