import 'package:flutter/material.dart';
import 'package:flutter_hortifruti/app/data/models/address.dart';
import 'package:flutter_hortifruti/app/data/models/payment_method.dart';
import 'package:flutter_hortifruti/app/data/models/shipping_by_city.dart';
import 'package:flutter_hortifruti/app/data/services/auth/service.dart';
import 'package:flutter_hortifruti/app/data/services/cart/service.dart';
import 'package:flutter_hortifruti/app/modules/checkout/repository.dart';
import 'package:flutter_hortifruti/app/routes/routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CheckoutController extends GetxController {
  final CheckoutRepository _repository;

  final _cartService = Get.find<CartService>();
  final _authService = Get.find<AuthService>();

  final paymentMethod = Rxn<PaymentMethodModel>();
  final addresses = RxList<AddressModel>.empty();
  final addressSelected = Rxn<AddressModel>();
  final loading = true.obs;

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
    if (addressSelected.value == null) {
      return null;
    }

    return _cartService.store.value?.shippingByCity.firstWhereOrNull(
      (shippingByCity) => shippingByCity.id == addressSelected.value?.city?.id,
    );
  }

  bool get deliveryToMyAddress => getShippingByCity != null;

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

        if (addresses.isNotEmpty) {
          addressSelected.value = addresses.first;
        }
        loading(false);
      },
      onError: (error) {
        loading(false);
      },
    );
  }

  void showAddresList() {
    Get.dialog(
      SimpleDialog(
        title: const Text('Selecione um endereço'),
        children: [
          for (final address in addresses)
            SimpleDialogOption(
              child: Text(
                '${address.street}, nº ${address.number}, ${address.district}',
              ),
              onPressed: () {
                addressSelected.value = address;
                Get.back();
              },
            ),
          TextButton(
            onPressed: () {
              Get.back();
              goToNewAddress();
            },
            child: const Text('Cadastrar endereço'),
          ),
        ],
      ),
    );
  }
}
