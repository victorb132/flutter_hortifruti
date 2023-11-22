import 'package:flutter/material.dart';
import 'package:flutter_hortifruti/app/data/models/user_login_request.dart';
import 'package:flutter_hortifruti/app/data/services/auth/service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final _authService = Get.find<AuthService>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    final user = UserLoginRequestModel(
      email: emailController.text,
      password: passwordController.text,
    );

    _authService.login(user).then((value) => {});
  }
}