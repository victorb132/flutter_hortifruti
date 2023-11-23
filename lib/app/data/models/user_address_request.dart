class UserAddressRequestModel {
  String street;
  String number;
  String neighborhood;
  String referencePoint;
  String? complement;
  int cityId;

  UserAddressRequestModel({
    required this.street,
    required this.number,
    required this.neighborhood,
    required this.referencePoint,
    this.complement,
    required this.cityId,
  });

  Map<String, dynamic> toJson() => {
        'street': street,
        'number': number,
        'neighborhood': neighborhood,
        'reference_point': referencePoint,
        'city_id': cityId,
        if (complement!.isNotEmpty) 'complement': complement,
      };
}
