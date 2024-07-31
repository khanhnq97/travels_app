import 'package:freezed_annotation/freezed_annotation.dart';
import 'flight.dart';
import 'hotel.dart';

part 'search_result.freezed.dart';
part 'search_result.g.dart';

@freezed
class SearchResult with _$SearchResult {
  const factory SearchResult({
    required List<Flight> flights,
    required List<Hotel> hotels,
  }) = _SearchResult;

  factory SearchResult.fromJson(Map<String, dynamic> json) => _$SearchResultFromJson(json);
}