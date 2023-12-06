import 'package:flutter/material.dart';
import 'package:flutter_hortifruti/app/data/models/address.dart';
import 'package:flutter_hortifruti/app/data/models/order_request.dart';
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
  bool get deliveryToMyAddress => getShippingByCity != null;
  num get totalOrder => totalCart + deliveryCost;
  bool get isLogged => _authService.isLogged;
  bool get canSendOrder => isLogged && deliveryToMyAddress;

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

  List<PaymentMethodModel> get paymentMethods =>
      _cartService.store.value?.paymentMethod ?? [];

  void changePaymentMethod(PaymentMethodModel? newPaymentMethod) {
    paymentMethod.value = newPaymentMethod;
  }

  void goToNewAddress() async {
    final result = await Get.toNamed(Routes.userAddress);

    if (result is bool && result) {
      fetchAddresses();
    }
  }

  void goToLogin() async {
    final result = await Get.toNamed(Routes.login);

    if (result is bool && result) {
      fetchAddresses();
    }
  }

  fetchAddresses() {
    _repository.getUserAddresses().then(
      (value) {
        addresses.assignAll(value);

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

  void sendOrder() {
    if (paymentMethod.value == null) {
      ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
        const SnackBar(
          content: Text('Selecione uma forma de pagamento'),
        ),
      );
      return;
    }

    final orderRequest = OrderRequestModel(
      store: _cartService.store.value!,
      paymentMethod: paymentMethod.value!,
      cartProducts: _cartService.products,
      address: addressSelected.value!,
      observation: _cartService.observation.value,
    );

    _repository.postOrder(orderRequest).then((value) {
      Get.dialog(
        AlertDialog(
          title: const Text('Pedido enviado!'),
          actions: [
            TextButton(
              onPressed: () {
                _cartService.finishCart();
                Get.offAllNamed(Routes.dashboard, arguments: 2);
              },
              child: const Text('Ver meus pedidos'),
            )
          ],
        ),
        barrierDismissible: false,
      );
    });
  }
}
