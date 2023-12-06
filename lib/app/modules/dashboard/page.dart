import 'package:flutter/material.dart';
import 'package:flutter_hortifruti/app/modules/dashboard/controller.dart';
import 'package:flutter_hortifruti/app/modules/home/page.dart';
import 'package:flutter_hortifruti/app/modules/user_profile/page.dart';
import 'package:get/get.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          onDestinationSelected: controller.changePageIndex,
          selectedIndex: controller.currentPageIndex.value,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.explore_outlined),
              label: 'Início',
              selectedIcon: Icon(Icons.explore),
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outlined),
              label: 'Meu Perfil',
              selectedIcon: Icon(Icons.person),
            ),
            NavigationDestination(
              icon: Icon(Icons.view_list_outlined),
              label: 'Meus Pedidos',
              selectedIcon: Icon(Icons.view_list),
            ),
          ],
        ),
      ),
      body: Obx(
        () => IndexedStack(
          index: controller.currentPageIndex.value,
          children: const [
            HomePage(),
            UserProfilePage(),
            Center(child: Text('Meus Pedidos')),
          ],
        ),
      ),
    );
  }
}
