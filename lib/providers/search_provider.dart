import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travels_app/data/repositories_impl/search_repository_impl.dart';
import 'package:travels_app/domain/usecases/search_flights_and_hotels.dart';
import 'package:travels_app/domain/usecases/apply_filter.dart';
import 'package:travels_app/domain/models/search_result.dart';
import 'package:travels_app/data/data_sources/search_data_source.dart';

class SearchState {
  final bool isLoading;
  final SearchResult? result;
  final String? errorMessage;

  const SearchState({
    this.isLoading = false,
    this.result,
    this.errorMessage,
  });
}

class SearchNotifier extends StateNotifier<SearchState> {
  final SearchFlightsAndHotels searchFlightsAndHotels;
  final ApplyFilter applyFilter;

  SearchNotifier({
    required this.searchFlightsAndHotels,
    required this.applyFilter,
  }) : super(const SearchState());

  Future<void> search(String from, String to, String date) async {
    state = const SearchState(isLoading: true);
    try {
      final result = await searchFlightsAndHotels(from, to, date);
      state = SearchState(result: result);
    } catch (e) {
      state = SearchState(errorMessage: e.toString());
    }
  }

  void applyPriceFilter(double maxPrice) {
    if (state.result != null) {
      final filteredResult = applyFilter(state.result!, maxPrice);
      state = SearchState(result: filteredResult);
    }
  }
}

final searchProvider = StateNotifierProvider<SearchNotifier, SearchState>((ref) {
  final searchDataSource = SearchDataSourceImpl();
  final searchRepository = SearchRepositoryImpl(searchDataSource);
  final searchFlightsAndHotels = SearchFlightsAndHotels(searchRepository);
  final applyFilter = ApplyFilter();
  return SearchNotifier(searchFlightsAndHotels: searchFlightsAndHotels, applyFilter: applyFilter);
});
