import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:travels_app/data/repositories_impl/payment_repository_impl.dart';
import 'package:travels_app/domain/models/payment.dart';

import '../../mock_classes.mocks.dart';

void main() {
  late PaymentRepositoryImpl paymentRepository;
  late MockPaymentDataSource mockPaymentDataSource;

  setUp(() {
    mockPaymentDataSource = MockPaymentDataSource();
    paymentRepository = PaymentRepositoryImpl(mockPaymentDataSource);
  });

  test('process payment with credit card', () async {
    const payment = Payment(id: '1', bookingId: '1', amount: 100.0, method: 'Credit Card');
    when(mockPaymentDataSource.processPayment(any)).thenAnswer((_) async {});

    await paymentRepository.processPayment(payment);

    verify(mockPaymentDataSource.processPayment(payment)).called(1);
  });

  test('process payment with PayPal', () async {
    const payment = Payment(id: '2', bookingId: '1', amount: 100.0, method: 'PayPal');
    when(mockPaymentDataSource.processPayment(any)).thenAnswer((_) async {});

    await paymentRepository.processPayment(payment);

    verify(mockPaymentDataSource.processPayment(payment)).called(1);
  });
}
