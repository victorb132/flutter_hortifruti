import 'package:flutter_hortifruti/app/data/provider/api.dart';
import 'package:flutter_hortifruti/app/modules/checkout/controller.dart';
import 'package:flutter_hortifruti/app/modules/checkout/repository.dart';
import 'package:get/get.dart';

class CheckoutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckoutController>(
      () => CheckoutController(CheckoutRepository(Get.find<Api>())),
    );
  }
}
