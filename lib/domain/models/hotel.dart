import 'package:freezed_annotation/freezed_annotation.dart';

part 'hotel.freezed.dart';
part 'hotel.g.dart';

@freezed
class Hotel with _$Hotel {
  const factory Hotel({
    required String id,
    required String location,
    required String name,
    required double price,
  }) = _Hotel;

  factory Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);
}