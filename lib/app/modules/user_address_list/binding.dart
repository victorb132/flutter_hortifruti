import 'package:flutter_hortifruti/app/data/provider/api.dart';
import 'package:flutter_hortifruti/app/modules/user_address_list/controller.dart';
import 'package:flutter_hortifruti/app/modules/user_address_list/repository.dart';
import 'package:get/get.dart';

class UserAddressListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserAddressListController>(() =>
        UserAddressListController(UserAddressListRepository(Get.find<Api>())));
  }
}
