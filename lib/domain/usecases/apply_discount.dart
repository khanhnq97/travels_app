class ApplyDiscount {
  final double discountPercentage;

  ApplyDiscount(this.discountPercentage);

  double call(double totalPrice) {
    return totalPrice * (1 - discountPercentage / 100);
  }
}