import 'package:travels_app/domain/repositories/search_repository.dart';
import 'package:travels_app/domain/models/search_result.dart';

class SearchFlightsAndHotels {
  final SearchRepository repository;

  SearchFlightsAndHotels(this.repository);

  Future<SearchResult> call(String from, String to, String date) {
    return repository.searchFlightsAndHotels(from, to, date);
  }
}
