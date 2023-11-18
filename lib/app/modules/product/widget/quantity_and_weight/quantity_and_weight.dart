import 'package:flutter/material.dart';
import 'package:flutter_hortifruti/app/modules/product/widget/quantity_and_weight/controller/quantity_and_weight_controller.dart';
import 'package:flutter_hortifruti/app/modules/product/widget/quantity_and_weight/quantity.dart';
import 'package:flutter_hortifruti/app/modules/product/widget/quantity_and_weight/weight.dart';
import 'package:get/get.dart';

class QuantityAndWeight extends StatelessWidget {
  final bool isKg;

  const QuantityAndWeight({super.key, this.isKg = false});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuantityAndWeightController>(
      init: QuantityAndWeightController(isKg: isKg),
      builder: (controller) => Column(
        children: [
          Quantity(),
          if (isKg) Weight(),
        ],
      ),
    );
  }
}
