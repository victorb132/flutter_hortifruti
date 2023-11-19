import 'package:flutter/material.dart';
import 'package:flutter_hortifruti/app/modules/store/controller.dart';
import 'package:flutter_hortifruti/app/routes/routes.dart';
import 'package:flutter_hortifruti/app/widgets/store_status.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

class StorePage extends GetView<StoreController> {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (state) => CustomScrollView(
          slivers: [
            const SliverAppBar(),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 8,
                  right: 16,
                  bottom: 16,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 96,
                      height: 96,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: state?.image ?? '',
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state?.name ?? '',
                            style: Get.textTheme.headlineLarge,
                          ),
                          const SizedBox(height: 8),
                          StoreStatus(isOnline: state?.isOnline ?? false)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final category = state?.categories[index];

                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.grey[200],
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 16,
                              ),
                              child: Text(
                                category?.name ?? '',
                                style: Get.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (category?.products != null) ...[
                        for (final product in category!.products)
                          ListTile(
                            leading: product.image.isNotEmpty
                                ? SizedBox(
                                    width: 56,
                                    height: 56,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: FadeInImage.memoryNetwork(
                                        placeholder: kTransparentImage,
                                        image: product.image,
                                      ),
                                    ),
                                  )
                                : null,
                            onTap: () => Get.toNamed(
                              Routes.product,
                              arguments: {'product': product, 'store': state},
                            ),
                            title: Text(product.name),
                            subtitle: Text(
                              NumberFormat.simpleCurrency()
                                      .format(double.tryParse(product.price)) +
                                  (product.isKG ? '/kg' : ''),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {},
                            ),
                          )
                      ]
                    ],
                  );
                },
                childCount: state?.categories.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.cart),
        tooltip: 'Ver carrinho',
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
