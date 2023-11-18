import 'package:flutter/material.dart';
import 'package:flutter_hortifruti/app/modules/product/controller.dart';
import 'package:flutter_hortifruti/app/modules/product/widget/quantity_and_weight/quantity_and_weight.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductPage extends GetView<ProductController> {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final product = controller.product.value;

    return Scaffold(
      appBar: AppBar(title: Text(product?.name ?? '')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: Column(
          children: [
            if (product?.image != null && product!.image.isNotEmpty) ...[
              Align(
                child: Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: product.image,
                    ),
                  ),
                ),
              ),
              if (product.description != null) ...[
                Text(
                  product.description!,
                  style: Get.textTheme.titleMedium,
                )
              ],
              Text(
                NumberFormat.simpleCurrency()
                        .format(double.tryParse(product.price)) +
                    (product.isKG ? '/kg' : ''),
                style: Get.textTheme.titleLarge,
              ),
              TextField(
                controller: controller.observationController,
                decoration: const InputDecoration(
                  labelText: 'Observação',
                ),
                maxLength: 50,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(
                    color: Colors.black12,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text(
                      'Altere ${product.isKG ? 'o peso' : 'a quantidade'}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 4),
                    QuantityAndWeight(isKg: product.isKG),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: () => controller.addToCart(),
                  child: const Text('Adicionar ao carrinho'),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
