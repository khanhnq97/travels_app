import 'package:travels_app/domain/models/search_result.dart';
import 'package:travels_app/domain/models/flight.dart';
import 'package:travels_app/domain/models/hotel.dart';

abstract class SearchDataSource {
  Future<SearchResult> searchFlightsAndHotels(String from, String to, String date);
}

class SearchDataSourceImpl implements SearchDataSource {
  @override
  Future<SearchResult> searchFlightsAndHotels(String from, String to, String date) async {
    // Mock implementation
    await Future.delayed(const Duration(seconds: 1));
    final flights = [Flight(id: 'flight1', from: from, to: to, date: DateTime.parse(date), price: 500)];
    final hotels = [Hotel(id: 'hotel1', location: to, name: 'Hotel Test', price: 300)];
    return SearchResult(flights: flights, hotels: hotels);
  }
}