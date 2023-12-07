import 'package:flutter_hortifruti/app/data/models/order.dart';
import 'package:flutter_hortifruti/app/modules/order_list/repository.dart';
import 'package:get/get.dart';

class OrderListController extends GetxController
    with StateMixin<List<OrderModel>> {
  final OrderListRepository _repository;
  OrderListController(this._repository);

  @override
  void onInit() {
    _repository.getOrders().then((data) {
      final status = data.isEmpty ? RxStatus.empty() : RxStatus.success();
      change(data, status: status);
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });

    super.onInit();
  }
}
