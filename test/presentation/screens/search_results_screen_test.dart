import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:travels_app/domain/models/flight.dart';
import 'package:travels_app/domain/models/hotel.dart';
import 'package:travels_app/domain/models/search_result.dart';
import 'package:travels_app/presentation/screens/search_results_screen.dart';
import 'package:travels_app/providers/search_provider.dart';

import '../../mock_classes.mocks.dart';
import 'search_screen_test.dart';

void main() {
  testWidgets('SearchResultsScreen displays loading indicator', (WidgetTester tester) async {
    // final container = ProviderContainer(
    //   overrides: [
    //     searchProvider.overrideWithProvider(StateNotifierProvider<SearchNotifier, SearchState>((ref) {
    //       return SearchNotifier(
    //         searchFlightsAndHotels: (from, to, date) async => const SearchResult(flights: [], hotels: []),
    //         applyFilter: ApplyFilter(),
    //       );
    //     })),
    //   ],
    // );

    final container = ProviderContainer(
      overrides: [
        searchProvider.overrideWith((ref) {
          return MockSearchNotifier(
            const SearchState(result: SearchResult(flights: [], hotels: [])),
            searchFlightsAndHotels: MockSearchFlightsAndHotels(),
            applyFilter: MockApplyFilter(),
          );
        }),
      ],
    );

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(home: SearchResultsScreen()),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('SearchResultsScreen displays error message', (WidgetTester tester) async {
    // final container = ProviderContainer(
    //   overrides: [
    //     searchProvider.overrideWithProvider(StateNotifierProvider<SearchNotifier, SearchState>((ref) {
    //       final notifier = SearchNotifier(
    //         searchFlightsAndHotels: (from, to, date) async => const SearchResult(flights: [], hotels: []),
    //         applyFilter: ApplyFilter(),
    //       );
    //       notifier.state = const SearchState(errorMessage: 'Failed to load results');
    //       return notifier;
    //     })),
    //   ],
    // );

    final container = ProviderContainer(
      overrides: [
        searchProvider.overrideWith((ref) {
          return MockSearchNotifier(
            const SearchState(errorMessage: 'Failed to load results'),
            searchFlightsAndHotels: MockSearchFlightsAndHotels(),
            applyFilter: MockApplyFilter(),
          );
        }),
      ],
    );

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(home: SearchResultsScreen()),
      ),
    );

    expect(find.text('Failed to load results'), findsOneWidget);
  });

  testWidgets('SearchResultsScreen displays search results', (WidgetTester tester) async {
    final searchResult = SearchResult(
      flights: [Flight(id: 'flight1', from: 'New York', to: 'Paris', date: DateTime(2023, 10, 21), price: 500)],
      hotels: [const Hotel(id: 'hotel1', location: 'Paris', name: 'Hotel Test', price: 300)],
    );
    // final container = ProviderContainer(
    //   overrides: [
    //     searchProvider.overrideWithProvider(StateNotifierProvider<SearchNotifier, SearchState>((ref) {
    //       final notifier = SearchNotifier(
    //         searchFlightsAndHotels: (from, to, date) async => searchResult,
    //         applyFilter: ApplyFilter(),
    //       );
    //       notifier.state = SearchState(result: searchResult);
    //       return notifier;
    //     })),
    //   ],
    // );

    final container = ProviderContainer(
      overrides: [
        searchProvider.overrideWith((ref) {
          return MockSearchNotifier(
            SearchState(result: searchResult),
            searchFlightsAndHotels: MockSearchFlightsAndHotels(),
            applyFilter: MockApplyFilter(),
          );
        }),
      ],
    );

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(home: SearchResultsScreen()),
      ),
    );

    expect(find.text('New York to Paris'), findsOneWidget);
    expect(find.text('Hotel Test'), findsOneWidget);
  });
}
