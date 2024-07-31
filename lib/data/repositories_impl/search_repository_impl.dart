import 'package:travels_app/domain/models/search_result.dart';
import 'package:travels_app/domain/repositories/search_repository.dart';
import 'package:travels_app/data/data_sources/search_data_source.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDataSource dataSource;

  SearchRepositoryImpl(this.dataSource);

  @override
  Future<SearchResult> searchFlightsAndHotels(String from, String to, String date) {
    return dataSource.searchFlightsAndHotels(from, to, date);
  }
}
