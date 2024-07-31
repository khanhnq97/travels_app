import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:travels_app/providers/booking_provider.dart';

class BookingManagementScreen extends ConsumerWidget {
  const BookingManagementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookingState = ref.watch(bookingProvider);
    final bookingNotifier = ref.read(bookingProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text("Booking Management")),
      body: bookingState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : bookingState.errorMessage != null
              ? Center(child: Text(bookingState.errorMessage!))
              : bookingState.booking == null
                  ? const Center(child: Text('No bookings'))
                  : ListView(
                      children: [
                        ListTile(
                          title: Text("Booking ID: ${bookingState.booking!.id}"),
                          subtitle: Text("Service ID: ${bookingState.booking!.serviceId}"),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              bookingNotifier.deleteBooking(bookingState.booking!.id);
                            },
                          ),
                        ),
                      ],
                    ),
    );
  }
}
