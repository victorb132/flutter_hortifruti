import 'package:flutter_hortifruti/app/data/models/cart_product.dart';
import 'package:flutter_hortifruti/app/data/models/store.dart';
import 'package:get/get.dart';

class CartService extends GetxService {
  final List<CartProductModel> products = RxList<CartProductModel>.empty();

  final store = Rxn<StoreModel>();

  void addProductToCart(CartProductModel cartProduct) {
    products.add(cartProduct);
  }

  void removeProductFromCart(CartProductModel cartProduct) {
    products.remove(cartProduct);
  }

  void newCart(StoreModel newStore) {
    store.value = newStore;
    products.clear();
  }
}
