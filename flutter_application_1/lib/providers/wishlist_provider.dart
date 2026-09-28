import 'dart:collection';

import 'package:flutter/foundation.dart';

import 'package:flutter_application_1/models/product.dart';

class WishlistProvider extends ChangeNotifier {
  final Map<String, ProductItem> _items = {};

  UnmodifiableListView<ProductItem> get items =>
      UnmodifiableListView(_items.values.toList());

  int get count => _items.length;

  bool isWishlisted(String productId) => _items.containsKey(productId);

  void toggleProduct(ProductItem product) {
    if (_items.containsKey(product.id)) {
      _items.remove(product.id);
    } else {
      _items[product.id] = product;
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
