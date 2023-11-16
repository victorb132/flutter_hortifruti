import 'package:flutter/material.dart';
import 'package:flutter_hortifruti/app/modules/home/controller.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hortifruti'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Horti Verde'),
            leading: FlutterLogo(),
            trailing: Text('Aberto'),
            // onTap: () => Get.toNamed('/dashboard'),
          )
        ],
      ),
    );
  }
}
