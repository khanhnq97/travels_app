import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travels_app/providers/search_provider.dart';
import 'service_details_screen.dart';

class SearchResultsScreen extends ConsumerWidget {
  const SearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(searchProvider);

    if (searchState.isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text("Search Results")),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (searchState.errorMessage != null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Search Results")),
        body: Center(child: Text(searchState.errorMessage!)),
      );
    }

    if (searchState.result == null || (searchState.result!.flights.isEmpty && searchState.result!.hotels.isEmpty)) {
      return Scaffold(
        appBar: AppBar(title: const Text("Search Results")),
        body: const Center(child: Text("No results")),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Search Results")),
      body: ListView(
        children: [
          ...searchState.result!.flights.map((flight) => ListTile(
                title: Text("${flight.from} to ${flight.to}"),
                subtitle: Text("\$${flight.price}"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceDetailsScreen(serviceId: flight.id)));
                },
              )),
          ...searchState.result!.hotels.map((hotel) => ListTile(
                title: Text(hotel.name),
                subtitle: Text("\$${hotel.price}"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceDetailsScreen(serviceId: hotel.id)));
                },
              )),
        ],
      ),
    );
  }
}
