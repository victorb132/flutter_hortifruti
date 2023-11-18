import 'package:flutter_hortifruti/app/modules/dashboard/binding.dart';
import 'package:flutter_hortifruti/app/modules/dashboard/page.dart';
import 'package:flutter_hortifruti/app/modules/product/binding.dart';
import 'package:flutter_hortifruti/app/modules/product/page.dart';
import 'package:flutter_hortifruti/app/modules/store/binding.dart';
import 'package:flutter_hortifruti/app/modules/store/page.dart';
import 'package:flutter_hortifruti/app/routes/routes.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.store,
      page: () => const StorePage(),
      binding: StoreBinding(),
    ),
    GetPage(
      name: Routes.product,
      page: () => const ProductPage(),
      binding: ProductBinding(),
    ),
  ];
}
