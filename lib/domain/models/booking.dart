import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking.freezed.dart';
part 'booking.g.dart';

@freezed
class Booking with _$Booking {
  const factory Booking({
    required String id,
    required String userId,
    required String serviceId,
    required DateTime bookingDate,
  }) = _Booking;

  factory Booking.fromJson(Map<String, dynamic> json) => _$BookingFromJson(json);
}