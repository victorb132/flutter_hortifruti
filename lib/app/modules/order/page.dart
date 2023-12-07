import 'package:flutter/material.dart';
import 'package:flutter_hortifruti/app/data/models/order_product.dart';
import 'package:flutter_hortifruti/app/modules/order/controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderPage extends GetView<OrderController> {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do pedido')),
      body: controller.obx(
        (state) => ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state?.store.name ?? '',
                    style: Get.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '#${state?.hashId ?? ''}',
                          style: Get.textTheme.titleMedium,
                        ),
                      ),
                      Text(
                        'Data: ${DateFormat("dd/MM/y 'às' HH:mm").format(state?.createdAt ?? DateTime.now())}',
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('Endereço de entrega'.toUpperCase(),
                  style: Get.textTheme.titleMedium),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                  '${state?.address?.street ?? ''}, nº ${state?.address?.number ?? ''}, ${state?.address?.district ?? ''}'),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('Andamento do pedido'.toUpperCase(),
                  style: Get.textTheme.titleMedium),
            ),
            for (final status in state?.statusList ?? [])
              ListTile(
                title: Text(status.name),
                trailing: Text(DateFormat.Hm().format(status.createdAt)),
              ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('Produtos'.toUpperCase(),
                  style: Get.textTheme.titleMedium),
            ),
            for (final orderProduct in state?.productList ?? [])
              ListTile(
                title: Text(orderProduct.product.name),
                leading: _buildProductQuantity(orderProduct),
                trailing: Text(
                    NumberFormat.simpleCurrency().format(orderProduct.total)),
              ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Expanded(child: Text('Custo de entrega')),
                  Text(
                      NumberFormat.simpleCurrency().format(state?.deliveryCost))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Total',
                      style: Get.textTheme.titleMedium,
                    ),
                  ),
                  Text(
                    NumberFormat.simpleCurrency().format(state?.value),
                    style: Get.textTheme.titleMedium,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductQuantity(OrderProductModel orderProduct) {
    return Text(
      NumberFormat.decimalPattern().format(orderProduct.quantity) +
          (orderProduct.product.isKG ? 'kg' : 'x'),
    );
  }
}
