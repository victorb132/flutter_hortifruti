import 'package:flutter_hortifruti/app/data/provider/api.dart';
import 'package:flutter_hortifruti/app/modules/register/controller.dart';
import 'package:flutter_hortifruti/app/modules/register/repository.dart';
import 'package:get/get.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
        () => RegisterController(RegisterRepository(Get.find<Api>())));
  }
}
