import 'package:flutter_hortifruti/app/data/models/product.dart';

class CartProductModel {
  ProductModel product;
  num quantity;
  String? observation;

  CartProductModel({
    required this.product,
    required this.quantity,
    this.observation,
  });

  num get total => double.tryParse(product.price) ?? 0 * quantity;
}
