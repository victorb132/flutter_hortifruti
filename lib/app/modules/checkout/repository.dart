import 'package:flutter_hortifruti/app/data/models/address.dart';
import 'package:flutter_hortifruti/app/data/models/order_request.dart';
import 'package:flutter_hortifruti/app/data/provider/api.dart';

class CheckoutRepository {
  final Api _api;

  CheckoutRepository(this._api);

  Future<List<AddressModel>> getUserAddresses() => _api.getUserAddresses();

  Future<void> postOrder(OrderRequestModel orderRequest) =>
      _api.postOrder(orderRequest);
}
