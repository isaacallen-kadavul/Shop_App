import 'package:flutter_application_1/models/product.dart';

class CartItem {
  CartItem({required this.product, this.quantity = 1});

  final ProductItem product;
  int quantity;
}
