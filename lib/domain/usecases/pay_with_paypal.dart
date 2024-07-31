import 'package:travels_app/domain/repositories/payment_repository.dart';
import 'package:travels_app/domain/models/payment.dart';

class PayWithPayPal {
  final PaymentRepository repository;

  PayWithPayPal(this.repository);

  Future<void> call(Payment payment) {
    return repository.processPayment(payment);
  }
}
