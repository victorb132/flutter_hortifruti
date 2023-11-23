class CityModel {
  int id;
  String name;
  String uf;

  CityModel({
    required this.id,
    required this.name,
    required this.uf,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'],
      name: json['name'],
      uf: json['state']['uf'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'uf': uf,
    };
  }
}
