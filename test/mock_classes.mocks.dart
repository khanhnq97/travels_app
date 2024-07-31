// Mocks generated by Mockito 5.4.4 from annotations
// in travels_app/test/mock_classes.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;

import 'package:mockito/mockito.dart' as _i1;
import 'package:travels_app/data/data_sources/auth_data_source.dart' as _i7;
import 'package:travels_app/data/data_sources/booking_data_source.dart' as _i10;
import 'package:travels_app/data/data_sources/payment_data_source.dart' as _i12;
import 'package:travels_app/data/data_sources/search_data_source.dart' as _i14;
import 'package:travels_app/domain/models/booking.dart' as _i11;
import 'package:travels_app/domain/models/payment.dart' as _i13;
import 'package:travels_app/domain/models/search_result.dart' as _i2;
import 'package:travels_app/domain/models/user.dart' as _i9;
import 'package:travels_app/domain/repositories/auth_repository.dart' as _i3;
import 'package:travels_app/domain/repositories/booking_repository.dart' as _i5;
import 'package:travels_app/domain/repositories/payment_repository.dart' as _i6;
import 'package:travels_app/domain/repositories/search_repository.dart' as _i4;
import 'package:travels_app/domain/usecases/apply_filter.dart' as _i18;
import 'package:travels_app/domain/usecases/book_services.dart' as _i19;
import 'package:travels_app/domain/usecases/login_with_email.dart' as _i15;
import 'package:travels_app/domain/usecases/logout.dart' as _i16;
import 'package:travels_app/domain/usecases/manage_booking.dart' as _i20;
import 'package:travels_app/domain/usecases/pay_with_credit_card.dart' as _i21;
import 'package:travels_app/domain/usecases/pay_with_paypal.dart' as _i22;
import 'package:travels_app/domain/usecases/search_flights_and_hotels.dart'
    as _i17;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeSearchResult_0 extends _i1.SmartFake implements _i2.SearchResult {
  _FakeSearchResult_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAuthRepository_1 extends _i1.SmartFake
    implements _i3.AuthRepository {
  _FakeAuthRepository_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSearchRepository_2 extends _i1.SmartFake
    implements _i4.SearchRepository {
  _FakeSearchRepository_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBookingRepository_3 extends _i1.SmartFake
    implements _i5.BookingRepository {
  _FakeBookingRepository_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePaymentRepository_4 extends _i1.SmartFake
    implements _i6.PaymentRepository {
  _FakePaymentRepository_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AuthDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthDataSource extends _i1.Mock implements _i7.AuthDataSource {
  MockAuthDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i9.User?> loginWithEmail(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #loginWithEmail,
          [
            email,
            password,
          ],
        ),
        returnValue: _i8.Future<_i9.User?>.value(),
      ) as _i8.Future<_i9.User?>);

  @override
  _i8.Future<_i9.User?> loginWithSocialMedia() => (super.noSuchMethod(
        Invocation.method(
          #loginWithSocialMedia,
          [],
        ),
        returnValue: _i8.Future<_i9.User?>.value(),
      ) as _i8.Future<_i9.User?>);

  @override
  _i8.Future<_i9.User?> loginWithSSO() => (super.noSuchMethod(
        Invocation.method(
          #loginWithSSO,
          [],
        ),
        returnValue: _i8.Future<_i9.User?>.value(),
      ) as _i8.Future<_i9.User?>);

  @override
  _i8.Future<void> logout() => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
}

/// A class which mocks [BookingDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockBookingDataSource extends _i1.Mock implements _i10.BookingDataSource {
  MockBookingDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i11.Booking?> getBooking(String? id) => (super.noSuchMethod(
        Invocation.method(
          #getBooking,
          [id],
        ),
        returnValue: _i8.Future<_i11.Booking?>.value(),
      ) as _i8.Future<_i11.Booking?>);

  @override
  _i8.Future<List<_i11.Booking>> getBookingsByUser(String? userId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getBookingsByUser,
          [userId],
        ),
        returnValue: _i8.Future<List<_i11.Booking>>.value(<_i11.Booking>[]),
      ) as _i8.Future<List<_i11.Booking>>);

  @override
  _i8.Future<void> createBooking(_i11.Booking? booking) => (super.noSuchMethod(
        Invocation.method(
          #createBooking,
          [booking],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<void> updateBooking(_i11.Booking? booking) => (super.noSuchMethod(
        Invocation.method(
          #updateBooking,
          [booking],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<void> deleteBooking(String? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteBooking,
          [id],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
}

/// A class which mocks [PaymentDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockPaymentDataSource extends _i1.Mock implements _i12.PaymentDataSource {
  MockPaymentDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<void> processPayment(_i13.Payment? payment) => (super.noSuchMethod(
        Invocation.method(
          #processPayment,
          [payment],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
}

/// A class which mocks [SearchDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchDataSource extends _i1.Mock implements _i14.SearchDataSource {
  MockSearchDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i2.SearchResult> searchFlightsAndHotels(
    String? from,
    String? to,
    String? date,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchFlightsAndHotels,
          [
            from,
            to,
            date,
          ],
        ),
        returnValue: _i8.Future<_i2.SearchResult>.value(_FakeSearchResult_0(
          this,
          Invocation.method(
            #searchFlightsAndHotels,
            [
              from,
              to,
              date,
            ],
          ),
        )),
      ) as _i8.Future<_i2.SearchResult>);
}

/// A class which mocks [LoginWithEmail].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginWithEmail extends _i1.Mock implements _i15.LoginWithEmail {
  MockLoginWithEmail() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.AuthRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeAuthRepository_1(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i3.AuthRepository);

  @override
  _i8.Future<_i9.User?> call(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [
            email,
            password,
          ],
        ),
        returnValue: _i8.Future<_i9.User?>.value(),
      ) as _i8.Future<_i9.User?>);
}

/// A class which mocks [Logout].
///
/// See the documentation for Mockito's code generation for more information.
class MockLogout extends _i1.Mock implements _i16.Logout {
  MockLogout() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.AuthRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeAuthRepository_1(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i3.AuthRepository);

  @override
  _i8.Future<void> call() => (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
}

/// A class which mocks [SearchFlightsAndHotels].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchFlightsAndHotels extends _i1.Mock
    implements _i17.SearchFlightsAndHotels {
  MockSearchFlightsAndHotels() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.SearchRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeSearchRepository_2(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i4.SearchRepository);

  @override
  _i8.Future<_i2.SearchResult> call(
    String? from,
    String? to,
    String? date,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [
            from,
            to,
            date,
          ],
        ),
        returnValue: _i8.Future<_i2.SearchResult>.value(_FakeSearchResult_0(
          this,
          Invocation.method(
            #call,
            [
              from,
              to,
              date,
            ],
          ),
        )),
      ) as _i8.Future<_i2.SearchResult>);
}

/// A class which mocks [ApplyFilter].
///
/// See the documentation for Mockito's code generation for more information.
class MockApplyFilter extends _i1.Mock implements _i18.ApplyFilter {
  MockApplyFilter() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.SearchResult call(
    _i2.SearchResult? result,
    double? maxPrice,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [
            result,
            maxPrice,
          ],
        ),
        returnValue: _FakeSearchResult_0(
          this,
          Invocation.method(
            #call,
            [
              result,
              maxPrice,
            ],
          ),
        ),
      ) as _i2.SearchResult);
}

/// A class which mocks [BookServices].
///
/// See the documentation for Mockito's code generation for more information.
class MockBookServices extends _i1.Mock implements _i19.BookServices {
  MockBookServices() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.BookingRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeBookingRepository_3(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i5.BookingRepository);

  @override
  _i8.Future<void> call(_i11.Booking? booking) => (super.noSuchMethod(
        Invocation.method(
          #call,
          [booking],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
}

/// A class which mocks [ManageBooking].
///
/// See the documentation for Mockito's code generation for more information.
class MockManageBooking extends _i1.Mock implements _i20.ManageBooking {
  MockManageBooking() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.BookingRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeBookingRepository_3(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i5.BookingRepository);

  @override
  _i8.Future<void> update(_i11.Booking? booking) => (super.noSuchMethod(
        Invocation.method(
          #update,
          [booking],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<void> delete(String? bookingId) => (super.noSuchMethod(
        Invocation.method(
          #delete,
          [bookingId],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
}

/// A class which mocks [PayWithCreditCard].
///
/// See the documentation for Mockito's code generation for more information.
class MockPayWithCreditCard extends _i1.Mock implements _i21.PayWithCreditCard {
  MockPayWithCreditCard() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.PaymentRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakePaymentRepository_4(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i6.PaymentRepository);

  @override
  _i8.Future<void> call(_i13.Payment? payment) => (super.noSuchMethod(
        Invocation.method(
          #call,
          [payment],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
}

/// A class which mocks [PayWithPayPal].
///
/// See the documentation for Mockito's code generation for more information.
class MockPayWithPayPal extends _i1.Mock implements _i22.PayWithPayPal {
  MockPayWithPayPal() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.PaymentRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakePaymentRepository_4(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i6.PaymentRepository);

  @override
  _i8.Future<void> call(_i13.Payment? payment) => (super.noSuchMethod(
        Invocation.method(
          #call,
          [payment],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
}