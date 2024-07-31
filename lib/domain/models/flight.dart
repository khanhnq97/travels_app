import 'package:freezed_annotation/freezed_annotation.dart';

part 'flight.freezed.dart';
part 'flight.g.dart';

@freezed
class Flight with _$Flight {
  const factory Flight({
    required String id,
    required String from,
    required String to,
    required DateTime date,
    required double price,
  }) = _Flight;

  factory Flight.fromJson(Map<String, dynamic> json) => _$FlightFromJson(json);
}