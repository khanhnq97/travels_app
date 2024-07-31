import 'package:travels_app/domain/models/payment.dart';
import 'package:travels_app/domain/repositories/payment_repository.dart';
import 'package:travels_app/data/data_sources/payment_data_source.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentDataSource dataSource;

  PaymentRepositoryImpl(this.dataSource);

  @override
  Future<void> processPayment(Payment payment) {
    return dataSource.processPayment(payment);
  }
}
