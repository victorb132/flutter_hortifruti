import 'package:flutter/material.dart';
import 'package:flutter_hortifruti/app/data/models/user_login_request.dart';
import 'package:flutter_hortifruti/app/data/models/user_profile_request.dart';
import 'package:flutter_hortifruti/app/data/services/auth/service.dart';
import 'package:flutter_hortifruti/app/modules/register/repository.dart';
import 'package:flutter_hortifruti/app/routes/routes.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final RegisterRepository _repository;

  RegisterController(this._repository);

  final _authService = Get.find<AuthService>();

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController(text: 'Teste');
  final emailController = TextEditingController(text: 'teste6@teste.com');
  final phoneController = TextEditingController(text: '11983571644');
  final passwordController = TextEditingController(text: 'senhateste');

  void submit() {
    Get.focusScope?.unfocus();

    if (!formKey.currentState!.validate()) {
      return;
    }

    final userProfileRequest = UserProfileRequestModel(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      password: passwordController.text,
    );

    _repository.register(userProfileRequest).then((value) async {
      await _authService.login(
        UserLoginRequestModel(
          email: emailController.text,
          password: passwordController.text,
        ),
      );

      ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
        const SnackBar(
          content: Text('Cadastro feito com sucesso!'),
        ),
      );

      Get.offAllNamed(Routes.dashboard);
    }, onError: (error) {
      Get.dialog(
        AlertDialog(
          title: Text(error.toString()),
        ),
      );
    });
  }
}
