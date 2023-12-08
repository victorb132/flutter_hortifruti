import 'package:flutter_hortifruti/app/data/models/cart_product.dart';
import 'package:flutter_hortifruti/app/data/models/store.dart';
import 'package:get/get.dart';

class CartService extends GetxService {
  final List<CartProductModel> products = RxList<CartProductModel>.empty();

  final store = Rxn<StoreModel>();
  final observation = ''.obs;

  bool get isEmpty => products.isEmpty;

  num get total =>
      products.fold(0, (total, cartProduct) => total + cartProduct.total);

  void addProductToCart(CartProductModel cartProduct) {
    products.add(cartProduct);
  }

  void removeProductFromCart(CartProductModel cartProduct) {
    products.remove(cartProduct);
  }

  bool isANewStore(StoreModel newStore) {
    return store.value?.id != newStore.id;
  }

  void clearCart() {
    products.clear();
  }

  void newCart(StoreModel newStore) {
    store.value = newStore;
    products.clear();
  }

  void finishCart() {
    clearCart();
    observation.value = '';
  }
}
