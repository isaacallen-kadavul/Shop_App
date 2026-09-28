import 'dart:collection';

import 'package:flutter/foundation.dart';

import 'package:flutter_application_1/models/cart_item.dart';
import 'package:flutter_application_1/models/product.dart';

class CartProvider extends ChangeNotifier {
  final Map<String, CartItem> _items = {};

  UnmodifiableListView<CartItem> get items =>
      UnmodifiableListView(_items.values.toList());

  int get itemCount =>
      _items.values.fold(0, (sum, item) => sum + item.quantity);

  double get subtotal => _items.values.fold(
    0,
    (sum, item) => sum + (item.product.price * item.quantity),
  );

  int quantityFor(String productId) => _items[productId]?.quantity ?? 0;

  bool contains(String productId) => _items.containsKey(productId);

  void addProduct(ProductItem product) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity += 1;
    } else {
      _items[product.id] = CartItem(product: product);
    }
    notifyListeners();
  }

  void incrementQuantity(String productId) {
    final item = _items[productId];
    if (item == null) {
      return;
    }
    item.quantity += 1;
    notifyListeners();
  }

  void decrementQuantity(String productId) {
    final item = _items[productId];
    if (item == null) {
      return;
    }
    if (item.quantity <= 1) {
      _items.remove(productId);
    } else {
      item.quantity -= 1;
    }
    notifyListeners();
  }

  void removeProduct(String productId) {
    if (_items.remove(productId) != null) {
      notifyListeners();
    }
  }

  void clear() {
    if (_items.isEmpty) {
      return;
    }
    _items.clear();
    notifyListeners();
  }
}
