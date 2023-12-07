import 'package:flutter/material.dart';
import 'package:flutter_hortifruti/app/modules/select_city/controller.dart';
import 'package:get/get.dart';

class SelectCityPage extends GetView<SelectCityController> {
  const SelectCityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Selecione uma cidade')),
      body: controller.obx(
        (state) => SingleChildScrollView(
          child: Column(
            children: [
              for (final city in state ?? [])
                ListTile(
                  title: Text('${city.name} / ${city.uf}'),
                  onTap: () => controller.onSelected(city),
                )
            ],
          ),
        ),
      ),
    );
  }
}
