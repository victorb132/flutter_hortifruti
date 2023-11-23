import 'package:flutter_hortifruti/app/data/models/address.dart';
import 'package:flutter_hortifruti/app/data/models/payment_method.dart';
import 'package:flutter_hortifruti/app/data/models/shipping_by_city.dart';
import 'package:flutter_hortifruti/app/data/services/auth/service.dart';
import 'package:flutter_hortifruti/app/data/services/cart/service.dart';
import 'package:flutter_hortifruti/app/modules/checkout/repository.dart';
import 'package:flutter_hortifruti/app/routes/routes.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  final CheckoutRepository _repository;

  final _cartService = Get.find<CartService>();
  final _authService = Get.find<AuthService>();

  final paymentMethod = Rxn<PaymentMethodModel>();
  final addresses = RxList<AddressModel>.empty();

  @override
  void onInit() async {
    await fetchAddresses();

    super.onInit();
  }

  CheckoutController(this._repository);

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

  void changePaymentMethod(PaymentMethodModel? newPaymentMethod) {
    paymentMethod.value = newPaymentMethod;
  }

  void goToNewAddress() {
    Get.toNamed(Routes.userAddress);
  }

  void goToLogin() {
    Get.toNamed(Routes.login);
  }

  fetchAddresses() {
    _repository.getUserAddresses().then(
      (value) {
        addresses.addAll(value);
      },
    );
  }
}
