import 'package:flutter_hortifruti/app/data/models/payment_method.dart';
import 'package:flutter_hortifruti/app/data/models/shipping_by_city.dart';
import 'package:flutter_hortifruti/app/data/services/auth/service.dart';
import 'package:flutter_hortifruti/app/data/services/cart/service.dart';
import 'package:flutter_hortifruti/app/routes/routes.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  final _cartService = Get.find<CartService>();
  final _authService = Get.find<AuthService>();

  CheckoutController();

  num get totalCart => _cartService.total;
  num get deliveryCost {
    if (getShippingByCity != null) {
      return getShippingByCity!.cost;
    }

    return 0;
  }

  ShippingByCityModel? get getShippingByCity {
    const cityId = 1;
    return _cartService.store.value?.shippingByCity.firstWhereOrNull(
      (shippingByCity) => shippingByCity.id == cityId,
    );
  }

  num get totalOrder => totalCart + deliveryCost;

  List<PaymentMethodModel> get paymentMethods =>
      _cartService.store.value?.paymentMethod ?? [];

  bool get isLogged => _authService.isLogged;

  final paymentMethod = Rxn<PaymentMethodModel>();

  void changePaymentMethod(PaymentMethodModel? newPaymentMethod) {
    paymentMethod.value = newPaymentMethod;
  }

  void goToLogin() {
    Get.toNamed(Routes.login);
  }
}
