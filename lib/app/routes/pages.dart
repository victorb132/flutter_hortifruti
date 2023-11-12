import 'package:flutter_hortifruti/app/modules/home/binding.dart';
import 'package:flutter_hortifruti/app/modules/home/page.dart';
import 'package:flutter_hortifruti/app/routes/routes.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.initial,
      page: () => const HomePage(),
      binding: HomeBinding(),
    )
  ];
}
