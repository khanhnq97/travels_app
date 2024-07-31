import 'package:travels_app/domain/models/search_result.dart';

class ApplyFilter {
  ApplyFilter();

  SearchResult call(SearchResult result, double maxPrice) {
    final filteredFlights = result.flights.where((flight) => flight.price <= maxPrice).toList();
    final filteredHotels = result.hotels.where((hotel) => hotel.price <= maxPrice).toList();
    return SearchResult(flights: filteredFlights, hotels: filteredHotels);
  }
}
