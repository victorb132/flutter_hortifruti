import 'package:flutter/material.dart';
import 'package:flutter_hortifruti/app/modules/checkout/controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends GetView<CheckoutController> {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!controller.isLogged)
                Center(
                  child: OutlinedButton(
                    onPressed: controller.goToLogin,
                    child: const Text('Entre com a sua conta para continuar'),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: Text(
                  'Forma de pagamento',
                  style: Get.textTheme.titleLarge,
                ),
              ),
              for (final paymentMethod in controller.paymentMethods)
                RadioListTile(
                  title: Text(paymentMethod.name),
                  value: paymentMethod,
                  groupValue: controller.paymentMethod.value,
                  onChanged: controller.changePaymentMethod,
                ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Produtos:',
                        style: Get.textTheme.titleMedium,
                      ),
                    ),
                    Text(
                      NumberFormat.simpleCurrency()
                          .format(controller.totalCart),
                      style: Get.textTheme.titleMedium,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Custo de entrega:',
                        style: Get.textTheme.titleMedium,
                      ),
                    ),
                    Text(
                      NumberFormat.simpleCurrency()
                          .format(controller.deliveryCost),
                      style: Get.textTheme.titleMedium,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Total:',
                        style: Get.textTheme.titleLarge,
                      ),
                    ),
                    Text(
                      NumberFormat.simpleCurrency()
                          .format(controller.totalOrder),
                      style: Get.textTheme.titleLarge,
                    )
                  ],
                ),
              ),
              Align(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Fazer pedido'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
