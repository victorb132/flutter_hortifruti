class ShippingByCityModel {
  int id;
  String city;
  num cost;

  ShippingByCityModel({
    required this.id,
    required this.city,
    required this.cost,
  });

  factory ShippingByCityModel.fromJson(Map<String, dynamic> json) =>
      ShippingByCityModel(
        id: json['id'],
        city: json['city'],
        cost: double.tryParse(json['delivery_cost']) ?? json['delivery_cost'],
      );
}
