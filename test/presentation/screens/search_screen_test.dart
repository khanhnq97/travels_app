import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:travels_app/domain/models/search_result.dart';
import 'package:travels_app/presentation/screens/search_screen.dart';
import 'package:travels_app/providers/search_provider.dart';

import '../../mock_classes.mocks.dart';

class MockSearchNotifier extends SearchNotifier {
  MockSearchNotifier(SearchState state, {required super.searchFlightsAndHotels, required super.applyFilter}) {
    this.state = state;
  }
}

void main() {
  testWidgets('SearchScreen displays search form', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(home: SearchScreen()),
      ),
    );

    expect(find.byType(TextField), findsNWidgets(4));
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('SearchScreen initiates search on button press', (WidgetTester tester) async {
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
        child: const MaterialApp(home: SearchScreen()),
      ),
    );

    await tester.enterText(find.byKey(const Key('flightFromField')), 'New York');
    await tester.enterText(find.byKey(const Key('flightToField')), 'Paris');
    await tester.enterText(find.byKey(const Key('flightDateField')), '2023-10-21');
    await tester.tap(find.byKey(const Key('searchButton')));
    await tester.pumpAndSettle();

    expect(find.byType(ListTile), findsNothing); // No results displayed
  });
}
