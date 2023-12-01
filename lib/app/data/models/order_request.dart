import 'package:flutter_hortifruti/app/data/models/address.dart';
import 'package:flutter_hortifruti/app/data/models/cart_product.dart';
import 'package:flutter_hortifruti/app/data/models/payment_method.dart';
import 'package:flutter_hortifruti/app/data/models/store.dart';

class OrderRequestModel {
  StoreModel store;
  PaymentMethodModel paymentMethod;
  List<CartProductModel> cartProducts;
  AddressModel address;
  String? observation;

  OrderRequestModel({
    required this.store,
    required this.paymentMethod,
    required this.cartProducts,
    required this.address,
    this.observation,
  });

  Map<String, dynamic> toJson() {
    return {
      'company_id': store.id,
      'supply_payment_id': paymentMethod.id,
      'products':
          cartProducts.map((cartProduct) => cartProduct.toJson()).toList(),
      'address_id': address.id,
      if (observation != null && observation!.trim().isNotEmpty)
        'observation': observation,
    };
  }
}
