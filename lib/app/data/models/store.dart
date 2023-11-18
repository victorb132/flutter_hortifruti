import 'package:flutter_hortifruti/app/data/models/category.dart';

class StoreModel {
  int id;
  String name;
  String image;
  bool isOnline;
  List<CategoryModel> categories = [];

  StoreModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isOnline,
    required this.categories,
  });

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
      );
}
