import 'package:flutter/material.dart';
import 'package:flutter_hortifruti/app/data/models/user_login_request.dart';
import 'package:flutter_hortifruti/app/data/services/auth/service.dart';
import 'package:flutter_hortifruti/app/routes/routes.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final _authService = Get.find<AuthService>();
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController(text: 'cliente@email.com');
  final passwordController = TextEditingController(text: '123456');

  void login() {
    Get.focusScope?.unfocus();

    if (!formKey.currentState!.validate()) {
      return;
    }

    final user = UserLoginRequestModel(
      email: emailController.text,
      password: passwordController.text,
    );

    _authService.login(user).then((value) {
      Get.back();
    }, onError: (error) {
      Get.dialog(AlertDialog(title: Text(error.toString())));
    });
  }
}
