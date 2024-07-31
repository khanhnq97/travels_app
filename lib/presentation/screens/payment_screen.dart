import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travels_app/providers/payment_provider.dart';
import 'package:travels_app/domain/models/payment.dart';
import 'package:travels_app/presentation/widgets/custom_button.dart';
import 'booking_confirmation_screen.dart';

class PaymentScreen extends ConsumerWidget {
  const PaymentScreen({super.key});

  void _payWithCard(PaymentNotifier notifier, Payment payment) {
    notifier.payWithCard(payment);
    // Handle navigation after payment success
  }

  void _payWithPaypal(PaymentNotifier notifier, Payment payment) {
    notifier.payWithPaypal(payment);
    // Handle navigation after payment success
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paymentNotifier = ref.read(paymentProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text("Payment")),
      body: Center(
        child: Column(
          children: [
            const Text('Enter payment details here'),
            CustomButton(
              text: 'Pay with Credit Card',
              onPressed: () {
                const payment = Payment(
                  id: 'payment-1',
                  bookingId: 'booking-1',
                  amount: 500.0,
                  method: 'Credit Card',
                );
                _payWithCard(paymentNotifier, payment);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookingConfirmationScreen(),
                  ),
                );
              },
            ),
            CustomButton(
              text: 'Pay with PayPal',
              onPressed: () {
                const payment = Payment(
                  id: 'payment-2',
                  bookingId: 'booking-1',
                  amount: 500.0,
                  method: 'PayPal',
                );
                _payWithPaypal(paymentNotifier, payment);
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
