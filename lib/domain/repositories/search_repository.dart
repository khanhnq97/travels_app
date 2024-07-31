import 'package:travels_app/domain/models/search_result.dart';

abstract class SearchRepository {
  Future<SearchResult> searchFlightsAndHotels(String from, String to, String date);
}
