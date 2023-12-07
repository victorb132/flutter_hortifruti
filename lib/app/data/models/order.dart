import 'package:flutter_hortifruti/app/data/models/address.dart';
import 'package:flutter_hortifruti/app/data/models/order_product.dart';
import 'package:flutter_hortifruti/app/data/models/order_status.dart';
import 'package:flutter_hortifruti/app/data/models/payment_method.dart';
import 'package:flutter_hortifruti/app/data/models/store.dart';

class OrderModel {
  String hashId;
  StoreModel store;
  num value;
  num deliveryCost;
  AddressModel? address;
  PaymentMethodModel? paymentMethod;
  List<OrderProductModel> productList;
  List<OrderStatusModel> statusList;
  String? observation;
  DateTime createdAt;

  OrderModel({
    required this.hashId,
    required this.store,
    required this.value,
    required this.deliveryCost,
    this.address,
    this.paymentMethod,
    required this.productList,
    required this.statusList,
    this.observation,
    required this.createdAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        hashId: json['hash_id'],
        store: StoreModel.fromJson(json['company']),
        value: double.tryParse(json['value']) ?? 0,
        deliveryCost: double.tryParse(json['delivery_cost']) ?? 0,
        address: json['address'] == null
            ? null
            : AddressModel.fromJson(json['address']),
        paymentMethod: json['payment_method'] == null
            ? null
            : PaymentMethodModel.fromJson(json['payment_method']),
        productList: json['products'] == null
            ? []
            : List<OrderProductModel>.from(
                json['products'].map(
                  (product) => OrderProductModel.fromJson(product),
                ),
              ),
        statusList: json['order_status'] == null
            ? []
            : List<OrderStatusModel>.from(
                json['order_status'].map(
                  (status) => OrderStatusModel.fromJson(status),
                ),
              ),
        observation: json['observation'],
        createdAt: DateTime.parse(json['created_at']),
      );
}
