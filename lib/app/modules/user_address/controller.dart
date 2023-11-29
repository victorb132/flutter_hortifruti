import 'package:flutter/material.dart';
import 'package:flutter_hortifruti/app/data/models/city.dart';
import 'package:flutter_hortifruti/app/data/models/user_address_request.dart';
import 'package:flutter_hortifruti/app/data/services/auth/service.dart';
import 'package:flutter_hortifruti/app/modules/user_address/repository.dart';
import 'package:get/get.dart';

class UserAddressController extends GetxController
    with StateMixin<List<CityModel>> {
  final UserAddressRepository _repository;

  UserAddressController(this._repository);

  final _authService = Get.find<AuthService>();

  final formKey = GlobalKey<FormState>();
  final streetController =
      TextEditingController(text: 'Praça Almirante Pena Boto');
  final numberController = TextEditingController(text: '50');
  final districtController = TextEditingController(text: 'Jardim Satélite');
  final referencePointController = TextEditingController(text: 'Perto do bar');
  final complementController = TextEditingController(text: 'Apt 50/ bloco 02');
  final cityId = RxnInt();

  @override
  void onInit() {
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
      street: streetController.text,
      number: numberController.text,
      district: districtController.text,
      referencePoint: referencePointController.text,
      cityId: cityId.value ?? 0,
      complement: complementController.text,
    );

    print(userAddressRequest.toJson());

    _repository.postAddress(userAddressRequest).then(
      (value) {
        ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
          const SnackBar(
            content: Text('Endereço cadastrado com sucesso!'),
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

  void changeCity(int? cityIdSelected) {
    cityId.value = cityIdSelected;
  }
}
