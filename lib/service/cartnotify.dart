import 'package:flutter/foundation.dart';

import '../models/productData.dart';

class CartProvider with ChangeNotifier {
  final List<Product> _cart = [];

  List<Product> get cart => _cart;

  double get totalPrice => _cart.fold(0.0, (sum, item) => sum + item.price);

  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }
}
