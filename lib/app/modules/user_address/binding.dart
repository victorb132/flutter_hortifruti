import 'package:flutter_hortifruti/app/data/provider/api.dart';
import 'package:flutter_hortifruti/app/modules/user_address/controller.dart';
import 'package:flutter_hortifruti/app/modules/user_address/repository.dart';
import 'package:get/get.dart';

class UserAddressBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserAddressController>(
        () => UserAddressController(UserAddressRepository(Get.find<Api>())));
  }
}
