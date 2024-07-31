// test/mock_classes.dart
import 'package:mockito/annotations.dart';
import 'package:travels_app/data/data_sources/auth_data_source.dart';
import 'package:travels_app/data/data_sources/booking_data_source.dart';
import 'package:travels_app/data/data_sources/payment_data_source.dart';
import 'package:travels_app/data/data_sources/search_data_source.dart';
import 'package:travels_app/domain/usecases/login_with_email.dart';
import 'package:travels_app/domain/usecases/logout.dart';
import 'package:travels_app/domain/usecases/search_flights_and_hotels.dart';
import 'package:travels_app/domain/usecases/apply_filter.dart';
import 'package:travels_app/domain/usecases/book_services.dart';
import 'package:travels_app/domain/usecases/manage_booking.dart';
import 'package:travels_app/domain/usecases/pay_with_credit_card.dart';
import 'package:travels_app/domain/usecases/pay_with_paypal.dart';

@GenerateMocks([
  AuthDataSource,
  BookingDataSource,
  PaymentDataSource,
  SearchDataSource,
  LoginWithEmail,
  Logout,
  SearchFlightsAndHotels,
  ApplyFilter,
  BookServices,
  ManageBooking,
  PayWithCreditCard,
  PayWithPayPal
])
void main() {}
