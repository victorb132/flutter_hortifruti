import 'package:flutter/material.dart';
import 'package:flutter_hortifruti/app/data/models/address.dart';
import 'package:flutter_hortifruti/app/modules/user_address_list/repository.dart';
import 'package:flutter_hortifruti/app/routes/routes.dart';
import 'package:get/get.dart';

class UserAddressListController extends GetxController
    with StateMixin<List<AddressModel>> {
  final UserAddressListRepository _repository;
  UserAddressListController(this._repository);

  @override
  void onInit() {
    fetchAddresses();
    super.onInit();
  }

  Future<void> fetchAddresses() {
    return _repository.getUserAddresses().then((data) {
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void goToNewAddress() async {
    final result = await Get.toNamed(Routes.userAddress);

    if (result is bool && result) {
      fetchAddresses();
    }
  }

  void deleteAddress(AddressModel address) {
    _repository.deleteAddress(address.id).then(
      (value) async {
        await fetchAddresses();
        ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
          const SnackBar(
            content: Text('O endereço foi removido com sucesso!'),
          ),
        );
      },
      onError: (error) => Get.dialog(
        AlertDialog(
          title: Text(error.toString()),
        ),
      ),
    );
  }
}
