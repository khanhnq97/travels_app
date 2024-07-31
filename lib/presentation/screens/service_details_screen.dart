import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travels_app/domain/models/booking.dart';
import 'package:travels_app/presentation/widgets/custom_button.dart';
import 'package:travels_app/providers/booking_provider.dart';
import 'booking_confirmation_screen.dart';

class ServiceDetailsScreen extends ConsumerWidget {
  final String serviceId;

  const ServiceDetailsScreen({super.key, required this.serviceId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Service Details")),
      body: Center(
        child: Column(
          children: [
            const Text('Service Details will be displayed here'),
            CustomButton(
              text: 'Book Now',
              onPressed: () {
                final booking = Booking(id: 'booking-1', userId: 'user-1', serviceId: serviceId, bookingDate: DateTime.now());
                ref.read(bookingProvider.notifier).book(booking);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookingConfirmationScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
