import 'package:flutter/material.dart';
import 'package:flutter_hortifruti/app/data/models/user_profile_request.dart';
import 'package:flutter_hortifruti/app/data/services/auth/service.dart';
import 'package:flutter_hortifruti/app/modules/user_profile/repository.dart';
import 'package:flutter_hortifruti/app/routes/routes.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController {
  final UserProfileRepository _repository;

  UserProfileController(this._repository);

  final _authService = Get.find<AuthService>();

  final formKey = GlobalKey<FormState>();
  final loading = false.obs;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  bool get isLogged => _authService.isLogged;

  @override
  void onInit() {
    ever(_authService.user, (_) => fetchUser());

    super.onInit();
  }

  void fetchUser() {
    loading(true);
    _repository.getUser().then((data) {
      nameController.text = data.name;
      emailController.text = data.email;
      phoneController.text = data.phone;

      loading(false);
    }, onError: (error) {
      loading(false);
    });
  }

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

    _repository.putUser(userProfileRequest).then(
      (value) {
        ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
          const SnackBar(
            content: Text('Seu perfil foi atualizado com sucesso!'),
          ),
        );

        passwordController.text = '';
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

  void logout() async {
    await _authService.logout();

    Get.offAllNamed(Routes.dashboard);
  }
}
