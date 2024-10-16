class CartManager {
  static final CartManager _instance = CartManager._internal();
  List<Map<String, dynamic>> _cart = [];

  factory CartManager() {
    return _instance;
  }

  CartManager._internal();

  void addToCart(Map<String, dynamic> product, int quantity) {
    _cart.add({'product': product, 'quantity': quantity});
  }

  List<Map<String, dynamic>> getCartItems() {
    return _cart;
  }

  void clearCart() {
    _cart.clear();
  }
}
