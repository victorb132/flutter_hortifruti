import 'package:flutter/material.dart';
import 'package:flutter_hortifruti/app/data/models/cart_product.dart';
import 'package:flutter_hortifruti/app/modules/cart/controller.dart';
import 'package:flutter_hortifruti/app/routes/routes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartPage extends GetView<CartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carrinho')),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: TextField(
                  controller: controller.observationController,
                  decoration: const InputDecoration(
                    labelText: 'Observação',
                  ),
                  maxLength: 80,
                ),
              ),
              if (controller.store != null)
                Align(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Text(controller.store?.name ?? ''),
                  ),
                ),
              for (final cartProduct in controller.products)
                ListTile(
                  title: Text(cartProduct.product.name),
                  subtitle: Text(
                    '${NumberFormat.simpleCurrency().format(cartProduct.total)} (${NumberFormat.simpleCurrency().format(cartProduct.product.price)})',
                  ),
                  leading: _buildProductQuantity(cartProduct),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      controller.removeProduct(cartProduct);
                    },
                  ),
                ),
              if (controller.products.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Seu carrinho está vazio'),
                )
              else
                ElevatedButton(
                  onPressed: () => Get.toNamed(Routes.checkout),
                  child: const Text('Avançar'),
                )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductQuantity(CartProductModel cartProduct) {
    return Text(
      NumberFormat.decimalPattern().format(cartProduct.quantity) +
          (cartProduct.product.isKG ? 'kg' : 'x'),
    );
  }
}
