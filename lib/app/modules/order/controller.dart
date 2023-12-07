import 'package:flutter_hortifruti/app/data/models/order.dart';
import 'package:flutter_hortifruti/app/modules/order/repository.dart';
import 'package:get/get.dart';

class OrderController extends GetxController with StateMixin<OrderModel> {
  final OrderRepository _repository;
  OrderController(this._repository);

  @override
  void onInit() {
    String id = Get.parameters['id'] ?? '';

    _repository.getOrder(id).then((data) {
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });

    super.onInit();
  }
}
