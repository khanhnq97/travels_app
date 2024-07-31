import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:travels_app/domain/models/search_result.dart';
import 'package:travels_app/providers/search_provider.dart';
import '../mock_classes.mocks.dart';

void main() {
  late MockSearchFlightsAndHotels mockSearchFlightsAndHotels;
  late MockApplyFilter mockApplyFilter;
  late SearchNotifier searchNotifier;

  setUp(() {
    mockSearchFlightsAndHotels = MockSearchFlightsAndHotels();
    mockApplyFilter = MockApplyFilter();
    searchNotifier = SearchNotifier(
      searchFlightsAndHotels: mockSearchFlightsAndHotels,
      applyFilter: mockApplyFilter,
    );
  });

  test('search success', () async {
    const searchResult = SearchResult(flights: [], hotels: []);
    when(mockSearchFlightsAndHotels.call(any, any, any)).thenAnswer((_) async => searchResult);

    await searchNotifier.search('New York', 'Paris', '2023-10-21');

    expect(searchNotifier.state.result, searchResult);
    verify(mockSearchFlightsAndHotels.call('New York', 'Paris', '2023-10-21')).called(1);
  });

  test('search failure', () async {
    when(mockSearchFlightsAndHotels.call(any, any, any)).thenThrow(Exception('Failed to search'));

    await searchNotifier.search('New York', 'Paris', '2023-10-21');

    expect(searchNotifier.state.errorMessage, 'Failed to search');
  });

  test('apply filter', () {
    const searchResult = SearchResult(flights: [], hotels: []);
    when(mockApplyFilter.call(any, any)).thenReturn(searchResult);

    searchNotifier.state = const SearchState(result: searchResult);
    searchNotifier.applyPriceFilter(500);

    expect(searchNotifier.state.result, searchResult);
    verify(mockApplyFilter.call(searchResult, 500)).called(1);
  });
}