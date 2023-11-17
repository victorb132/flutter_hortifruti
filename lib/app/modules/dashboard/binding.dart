import 'package:flutter_hortifruti/app/data/provider/api.dart';
import 'package:flutter_hortifruti/app/modules/dashboard/controller.dart';
import 'package:flutter_hortifruti/app/modules/home/controller.dart';
import 'package:flutter_hortifruti/app/modules/home/repository.dart';
import 'package:get/get.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(
        () => HomeController(HomeRepository(Get.find<Api>())));
  }
}
