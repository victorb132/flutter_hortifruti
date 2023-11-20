import 'package:flutter/material.dart';
import 'package:flutter_hortifruti/app/modules/cart/controller.dart';
import 'package:get/get.dart';

class CartPage extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('CartPage')),
        body: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ));
  }
}
