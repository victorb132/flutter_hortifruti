import 'package:flutter_hortifruti/app/data/models/address.dart';
import 'package:flutter_hortifruti/app/data/provider/api.dart';

class UserAddressListRepository {
  final Api _api;

  UserAddressListRepository(this._api);

  Future<List<AddressModel>> getUserAddresses() => _api.getUserAddresses();

  Future<void> deleteAddress(int id) => _api.deleteAddress(id);
}
