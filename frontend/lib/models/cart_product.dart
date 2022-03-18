class CartProduct {
  String productId;
  int count;

  CartProduct({required this.count, required this.productId});

  void incrementCount() {
    count++;
  }
}
