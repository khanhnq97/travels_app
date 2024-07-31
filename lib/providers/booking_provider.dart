import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travels_app/data/repositories_impl/booking_repository_impl.dart';
import 'package:travels_app/domain/usecases/book_services.dart';
import 'package:travels_app/domain/usecases/manage_booking.dart';
import 'package:travels_app/domain/models/booking.dart';
import 'package:travels_app/data/data_sources/booking_data_source.dart';

class BookingState {
  final bool isLoading;
  final Booking? booking;
  final String? errorMessage;

  const BookingState({
    this.isLoading = false,
    this.booking,
    this.errorMessage,
  });
}

class BookingNotifier extends StateNotifier<BookingState> {
  final BookServices bookServices;
  final ManageBooking manageBooking;

  BookingNotifier({
    required this.bookServices,
    required this.manageBooking,
  }) : super(const BookingState());

  Future<void> book(Booking booking) async {
    state = const BookingState(isLoading: true);
    try {
      await bookServices(booking);
      state = BookingState(booking: booking);
    } catch (e) {
      state = BookingState(errorMessage: e.toString());
    }
  }

  Future<void> updateBooking(Booking booking) async {
    state = const BookingState(isLoading: true);
    try {
      await manageBooking.update(booking);
      state = BookingState(booking: booking);
    } catch (e) {
      state = BookingState(errorMessage: e.toString());
    }
  }

  Future<void> deleteBooking(String id) async {
    state = const BookingState(isLoading: true);
    try {
      await manageBooking.delete(id);
      state = const BookingState();
    } catch (e) {
      state = BookingState(errorMessage: e.toString());
    }
  }
}

final bookingProvider = StateNotifierProvider<BookingNotifier, BookingState>((ref) {
  final bookingDataSource = BookingDataSourceImpl();
  final bookingRepository = BookingRepositoryImpl(bookingDataSource);
  final bookServices = BookServices(bookingRepository);
  final manageBooking = ManageBooking(bookingRepository);
  return BookingNotifier(bookServices: bookServices, manageBooking: manageBooking);
});
