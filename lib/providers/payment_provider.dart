import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travels_app/data/repositories_impl/payment_repository_impl.dart';
import 'package:travels_app/domain/usecases/pay_with_credit_card.dart';
import 'package:travels_app/domain/usecases/pay_with_paypal.dart';
import 'package:travels_app/domain/models/payment.dart';
import 'package:travels_app/data/data_sources/payment_data_source.dart';

class PaymentState {
  final bool isLoading;
  final Payment? payment;
  final String? errorMessage;

  const PaymentState({
    this.isLoading = false,
    this.payment,
    this.errorMessage,
  });
}

class PaymentNotifier extends StateNotifier<PaymentState> {
  final PayWithCreditCard payWithCreditCard;
  final PayWithPayPal payWithPayPal;

  PaymentNotifier({
    required this.payWithCreditCard,
    required this.payWithPayPal,
  }) : super(const PaymentState());

  Future<void> payWithCard(Payment payment) async {
    state = const PaymentState(isLoading: true);
    try {
      await payWithCreditCard(payment);
      state = PaymentState(payment: payment);
    } catch (e) {
      state = PaymentState(errorMessage: e.toString());
    }
  }

  Future<void> payWithPaypal(Payment payment) async {
    state = const PaymentState(isLoading: true);
    try {
      await payWithPayPal(payment);
      state = PaymentState(payment: payment);
    } catch (e) {
      state = PaymentState(errorMessage: e.toString());
    }
  }
}

final paymentProvider = StateNotifierProvider<PaymentNotifier, PaymentState>((ref) {
  final paymentDataSource = PaymentDataSourceImpl();
  final paymentRepository = PaymentRepositoryImpl(paymentDataSource);
  final payWithCreditCard = PayWithCreditCard(paymentRepository);
  final payWithPayPal = PayWithPayPal(paymentRepository);
  return PaymentNotifier(payWithCreditCard: payWithCreditCard, payWithPayPal: payWithPayPal);
});
