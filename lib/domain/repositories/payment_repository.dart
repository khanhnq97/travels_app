import 'package:travels_app/domain/models/payment.dart';

abstract class PaymentRepository {
  Future<void> processPayment(Payment payment);
}
