import 'package:flutter/material.dart';
import 'package:flutter_hortifruti/app/data/models/user.dart';
import 'package:flutter_hortifruti/app/data/models/user_profile_request.dart';
import 'package:flutter_hortifruti/app/data/services/auth/service.dart';
import 'package:flutter_hortifruti/app/modules/user_profile/repository.dart';
import 'package:flutter_hortifruti/app/routes/routes.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController with StateMixin<UserModel> {
  final UserProfileRepository _repository;

  UserProfileController(this._repository);

  final _authService = Get.find<AuthService>();

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
    _repository.getUser().then((data) {
      nameController.text = data.name;
      emailController.text = data.email;
      phoneController.text = data.phone;

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
