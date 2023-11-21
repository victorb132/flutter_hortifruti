import 'package:flutter/material.dart';
import 'package:flutter_hortifruti/app/data/models/cart_product.dart';
import 'package:flutter_hortifruti/app/data/models/product.dart';
import 'package:flutter_hortifruti/app/data/models/store.dart';
import 'package:flutter_hortifruti/app/data/services/cart/service.dart';
import 'package:flutter_hortifruti/app/modules/product/widget/quantity_and_weight/controller/quantity_and_weight_controller.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  ProductController();

  final product = Rxn<ProductModel>();
  final store = Rxn<StoreModel>();
  final observationController = TextEditingController();
  final _cartService = Get.find<CartService>();

  @override
  void onInit() {
    product.value = Get.arguments['product'];
    store.value = Get.arguments['store'];

    super.onInit();
  }

  void addToCart() {
    final quantity = Get.find<QuantityAndWeightController>().quantity;

    if (store.value != null) {
      _cartService.newCart(store.value!);
    }

    if (product.value != null) {
      _cartService.addProductToCart(
        CartProductModel(
          product: product.value!,
          quantity: quantity,
          observation: observationController.text,
        ),
      );
    }

    ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
      SnackBar(
        content:
            Text('O item ${product.value!.name} foi adicionado no carrinho'),
      ),
    );

    Future.delayed(
      const Duration(milliseconds: 300),
      () => Get.back(),
    );
  }
}
