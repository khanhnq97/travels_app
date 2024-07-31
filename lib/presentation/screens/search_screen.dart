import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travels_app/presentation/widgets/custom_button.dart';
import 'package:travels_app/providers/search_provider.dart';
import 'search_results_screen.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _flightFromController = TextEditingController();
  final TextEditingController _flightToController = TextEditingController();
  final TextEditingController _flightDateController = TextEditingController();
  final TextEditingController _hotelLocationController = TextEditingController();

  void _search() {
    ref.read(searchProvider.notifier).search(
          _flightFromController.text,
          _flightToController.text,
          _flightDateController.text,
        );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SearchResultsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _flightFromController,
              decoration: const InputDecoration(labelText: 'Flight From'),
            ),
            TextField(
              controller: _flightToController,
              decoration: const InputDecoration(labelText: 'Flight To'),
            ),
            TextField(
              controller: _flightDateController,
              decoration: const InputDecoration(labelText: 'Flight Date'),
            ),
            TextField(
              controller: _hotelLocationController,
              decoration: const InputDecoration(labelText: 'Hotel Location'),
            ),
            CustomButton(
              text: 'Search',
              onPressed: _search,
            ),
          ],
        ),
      ),
    );
  }
}
