class ProductModel {
  int id;
  String name;
  String price;
  String unitOfMeasure;
  String? description;
  String image;

  bool get isKG => unitOfMeasure == 'KG';

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.unitOfMeasure,
    this.description,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        unitOfMeasure: json['unity'],
        price: json['price'],
        description: json['description'],
      );
}
