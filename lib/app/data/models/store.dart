import 'package:flutter_hortifruti/app/data/models/category.dart';
import 'package:flutter_hortifruti/app/data/models/payment_method.dart';
import 'package:flutter_hortifruti/app/data/models/shipping_by_city.dart';

class StoreModel {
  int id;
  String name;
  String image;
  bool isOnline;
  List<CategoryModel> categories = [];
  List<ShippingByCityModel> shippingByCity;
  List<PaymentMethodModel> paymentMethod;

  StoreModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.isOnline,
      required this.categories,
      required this.shippingByCity,
      required this.paymentMethod});

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        id: json['id'],
        name: json['name'],
        image: json['logo'],
        isOnline: json['online'] == 1,
        categories: json['categories'] == null
            ? []
            : List<CategoryModel>.from(
                json['categories']
                    .map((category) => CategoryModel.fromJson(category)),
              ),
        shippingByCity: json['cities'] == null
            ? []
            : List<ShippingByCityModel>.from(
                json['cities']
                    .map((city) => ShippingByCityModel.fromJson(city)),
              ),
        paymentMethod: json['supply_payments'] == null
            ? []
            : List<PaymentMethodModel>.from(
                json['supply_payments']
                    .map((payment) => PaymentMethodModel.fromJson(payment)),
              ),
      );
}
