import 'package:flutter/material.dart';
import 'package:flutter_hortifruti/app/modules/home/controller.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hortifruti'),
      ),
      body: controller.obx(
        (state) => ListView(
          children: [
            if (state != null)
              for (final store in state)
                ListTile(
                  title: Text(store.name),
                  leading: SizedBox(
                    width: 56,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: store.image,
                      ),
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  onTap: () {},
                  trailing: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: store.isOnline ? Colors.green : Colors.black45,
                      border: Border.all(color: Colors.black12, width: 2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      store.isOnline ? 'Aberto' : 'Fechado',
                      style: Get.textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
          ],
        ),
        onEmpty: const Center(
          child:
              Text('Não há nenhum estabelecimento cadastrado na sua cidade.'),
        ),
        onError: (error) {
          return Center(
            child: Text(
              'Não conseguimos buscar os estabelecimentos para você. Tente novamente mais tarde.',
              textAlign: TextAlign.center,
              style: Get.textTheme.bodyMedium?.copyWith(
                color: Get.theme.colorScheme.error,
              ),
            ),
          );
        },
      ),
    );
  }
}
