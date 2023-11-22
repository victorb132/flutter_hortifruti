import 'package:flutter_hortifruti/app/data/models/user_login_request.dart';
import 'package:flutter_hortifruti/app/data/services/auth/repository.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  AuthRepository _repository;

  AuthService(this._repository);

  Future login(UserLoginRequestModel user) {
    final data = _repository.login(user);

    return data;
  }
}
