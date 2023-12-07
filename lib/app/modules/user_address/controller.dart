import 'package:flutter/material.dart';
import 'package:flutter_hortifruti/app/data/models/address.dart';
import 'package:flutter_hortifruti/app/data/models/city.dart';
import 'package:flutter_hortifruti/app/data/models/user_address_request.dart';
import 'package:flutter_hortifruti/app/modules/user_address/repository.dart';
import 'package:get/get.dart';

class UserAddressController extends GetxController
    with StateMixin<List<CityModel>> {
  final UserAddressRepository _repository;

  UserAddressController(this._repository);

  final formKey = GlobalKey<FormState>();
  final streetController =
      TextEditingController(text: 'Praça Almirante Pena Boto');
  final numberController = TextEditingController(text: '50');
  final districtController = TextEditingController(text: 'Jardim Satélite');
  final referencePointController = TextEditingController(text: 'Perto do bar');
  final complementController = TextEditingController(text: 'Apt 50/ bloco 02');
  final cityId = RxnInt();
  final _address = Rxn<AddressModel>();
  final editing = RxBool(false);

  @override
  void onInit() {
    if (Get.arguments != null) {
      editing(true);
      _address.value = Get.arguments;

      streetController.text = _address.value?.street ?? '';
      numberController.text = _address.value?.number ?? '';
      districtController.text = _address.value?.district ?? '';
      referencePointController.text = _address.value?.referencePoint ?? '';
      complementController.text = _address.value?.complement ?? '';
      cityId.value = _address.value?.city?.id ?? 0;
    }

    _repository.getCities().then((data) {
      change(data, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
    super.onInit();
  }

  void submit() {
    Get.focusScope?.unfocus();

    if (!formKey.currentState!.validate()) {
      return;
    }

    final userAddressRequest = UserAddressRequestModel(
      id: editing.isTrue ? _address.value?.id : null,
      street: streetController.text,
      number: numberController.text,
      district: districtController.text,
      referencePoint: referencePointController.text,
      cityId: cityId.value ?? 0,
      complement: complementController.text,
    );

    if (editing.isTrue) {
      return _updateAddress(userAddressRequest);
    }

    _addAddress(userAddressRequest);
  }

  void _addAddress(UserAddressRequestModel userAddressRequest) {
    _repository.postAddress(userAddressRequest).then(
      (value) {
        ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
          const SnackBar(
            content: Text('Endereço cadastrado com sucesso!'),
          ),
        );

        Get.back(result: true);
      },
      onError: (error) {
        Get.dialog(
          AlertDialog(
            title: Text(error.toString()),
          ),
        );
      },
    );
  }

  void _updateAddress(UserAddressRequestModel userAddressRequest) {
    _repository.putAddress(userAddressRequest).then(
      (value) {
        ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
          const SnackBar(
            content: Text('Endereço atualizado com sucesso!'),
          ),
        );

        Get.back(result: true);
      },
      onError: (error) {
        Get.dialog(
          AlertDialog(
            title: Text(error.toString()),
          ),
        );
      },
    );
  }

  void changeCity(int? cityIdSelected) {
    cityId.value = cityIdSelected;
  }
}
