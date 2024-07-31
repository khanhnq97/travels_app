import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:travels_app/data/repositories_impl/search_repository_impl.dart';
import 'package:travels_app/domain/models/search_result.dart';

import '../../mock_classes.mocks.dart';

void main() {
  late SearchRepositoryImpl searchRepository;
  late MockSearchDataSource mockSearchDataSource;

  setUp(() {
    mockSearchDataSource = MockSearchDataSource();
    searchRepository = SearchRepositoryImpl(mockSearchDataSource);
  });

  test('search flights and hotels success', () async {
    const searchResult = SearchResult(flights: [], hotels: []);
    when(mockSearchDataSource.searchFlightsAndHotels(any, any, any)).thenAnswer((_) async => searchResult);

    final result = await searchRepository.searchFlightsAndHotels('New York', 'Paris', '2023-10-21');

    expect(result, searchResult);
    verify(mockSearchDataSource.searchFlightsAndHotels('New York', 'Paris', '2023-10-21')).called(1);
  });

  test('search flights and hotels failure', () async {
    when(mockSearchDataSource.searchFlightsAndHotels(any, any, any)).thenThrow(Exception('Failed to search'));

    expect(
      () => searchRepository.searchFlightsAndHotels('New York', 'Paris', '2023-10-21'),
      throwsException,
    );
  });
}
