import 'package:flutter_hortifruti/app/data/models/product.dart';

class OrderProductModel {
  ProductModel product;
  num quantity;
  num value;
  String? observation;

  OrderProductModel({
    required this.product,
    required this.quantity,
    required this.value,
    this.observation,
  });

  num get total => value * quantity;

  Map<String, dynamic> toJson() {
    return {
      'product_id': product.id,
      'quantity': quantity,
      if (observation != null && observation!.trim().isNotEmpty)
        'observation': observation,
    };
  }

  factory OrderProductModel.fromJson(Map<String, dynamic> json) =>
      OrderProductModel(
        product: ProductModel.fromJson(json['product']),
        quantity: double.tryParse(json['quantity']) ?? 0,
        value: double.tryParse(json['value']) ?? 0,
        observation: json['observation'],
      );
}
