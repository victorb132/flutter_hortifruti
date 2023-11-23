import 'package:flutter_hortifruti/app/data/models/city.dart';
import 'package:flutter_hortifruti/app/data/models/user_address_request.dart';
import 'package:flutter_hortifruti/app/data/provider/api.dart';

class UserAddressRepository {
  final Api _api;

  UserAddressRepository(this._api);

  Future<List<CityModel>> getCities() => _api.getCities();

  Future<void> postAddress(UserAddressRequestModel userAddressRequestModel) =>
      _api.postAddress(userAddressRequestModel);
}
