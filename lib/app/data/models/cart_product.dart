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

  num get total => product.price * quantity;

  Map<String, dynamic> toJson() {
    return {
      'product_id': product.id,
      'quantity': quantity,
      if (observation != null && observation!.trim().isNotEmpty)
        'observation': observation,
    };
  }
}
