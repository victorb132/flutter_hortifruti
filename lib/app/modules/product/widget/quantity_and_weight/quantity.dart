import 'package:flutter/material.dart';
import 'package:flutter_hortifruti/app/modules/product/widget/quantity_and_weight/controller/quantity_and_weight_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Quantity extends StatelessWidget {
  final controller = Get.find<QuantityAndWeightController>();

  Quantity({super.key});

  @override
  Widget build(BuildContext context) {
    final quantity = controller.quantity;
    final isKg = controller.isKg;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: quantity > 1
              ? () => controller.changeQuantity(quantity - 1)
              : null,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            minimumSize: const Size(40, 40),
          ),
          child: const Icon(Icons.remove),
        ),
        Container(
          width: isKg ? 96 : 48,
          padding: const EdgeInsets.all(8),
          child: Text(
            NumberFormat.decimalPattern().format(quantity) + (isKg ? 'kg' : ''),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => controller.changeQuantity(quantity + 1),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            minimumSize: const Size(40, 40),
          ),
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
