import 'package:flutter/material.dart';
import 'package:flutter_hortifruti/app/modules/order_list/controller.dart';
import 'package:flutter_hortifruti/app/routes/routes.dart';
import 'package:get/get.dart';

class OrderListPage extends GetView<OrderListController> {
  const OrderListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meus Pedidos')),
      body: controller.obx(
        (state) => ListView(
          children: [
            for (final order in state!)
              ListTile(
                title: Text('Pedido #${order.hashId}'),
                subtitle: Text(order.store.name),
                trailing: Chip(
                  label: Text(order.statusList.last.name),
                ),
                onTap: () => Get.toNamed(
                  Routes.order.replaceFirst(':id', order.hashId),
                ),
              )
          ],
        ),
        onEmpty: const Center(
          child: Text('Você não fez nenhum pedido!'),
        ),
        onError: (error) => Center(
          child: ElevatedButton(
            onPressed: () => Get.toNamed(Routes.login),
            child: const Text('Entre com a sua conta para ver os pedidos'),
          ),
        ),
      ),
    );
  }
}
