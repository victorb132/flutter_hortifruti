import 'package:flutter_hortifruti/app/data/models/order.dart';
import 'package:flutter_hortifruti/app/data/provider/api.dart';

class OrderListRepository {
  final Api _api;

  OrderListRepository(this._api);

  Future<List<OrderModel>> getOrders() => _api.getOrders();
}
