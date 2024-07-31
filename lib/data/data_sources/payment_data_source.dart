import 'package:travels_app/domain/models/payment.dart';

abstract class PaymentDataSource {
  Future<void> processPayment(Payment payment);
}

class PaymentDataSourceImpl implements PaymentDataSource {
  @override
  Future<void> processPayment(Payment payment) async {
    // Mock implementation
    await Future.delayed(const Duration(seconds: 1));
  }
}