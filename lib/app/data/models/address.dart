import 'package:flutter_hortifruti/app/data/models/city.dart';

class AddressModel {
  int id;
  String street;
  String number;
  String district;
  String referencePoint;
  String? complement;
  CityModel? city;

  AddressModel({
    required this.id,
    required this.street,
    required this.number,
    required this.district,
    required this.referencePoint,
    this.complement,
    this.city,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'],
      street: json['street'],
      number: json['number'],
      district: json['district'],
      referencePoint: json['reference_point'],
      complement: json['complement'],
      city: json['city'] != null ? CityModel.fromJson(json['city']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'street': street,
      'number': number,
      'district': district,
      'reference_point': referencePoint,
      'complement': complement,
    };
  }
}
