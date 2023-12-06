import 'package:flutter/material.dart';
import 'package:flutter_hortifruti/app/modules/user_address_list/controller.dart';
import 'package:get/get.dart';

class UserAddressListPage extends GetView<UserAddressListController> {
  const UserAddressListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Endereços')),
      body: controller.obx(
        (state) => SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: controller.goToNewAddress,
                        icon: const Icon(Icons.add_location),
                        label: const Text('Novo endereço'),
                      ),
                    ),
                  ],
                ),
              ),
              if (state!.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Você não possui nenhum endereço cadastrado!',
                    textAlign: TextAlign.center,
                  ),
                ),
              for (final address in state)
                ListTile(
                  title: Text('${address.street}, nº ${address.number}'),
                  subtitle: Text('${address.district}, ${address.city?.name}'),
                  trailing: PopupMenuButton(
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'edit',
                        child: Text('Editar'),
                      ),
                      const PopupMenuItem(
                        value: 'delete',
                        child: Text('Excluir'),
                      ),
                    ],
                    onSelected: (value) {
                      switch (value) {
                        case 'delete':
                          controller.deleteAddress(address);
                          break;
                        case 'edit':
                          controller.goToEditAddress(address);
                          break;
                        default:
                      }
                    },
                  ),
                  onTap: () => controller.goToEditAddress(address),
                )
            ],
          ),
        ),
      ),
    );
  }
}
