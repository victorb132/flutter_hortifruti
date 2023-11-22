import 'package:flutter_hortifruti/app/data/models/user.dart';
import 'package:flutter_hortifruti/app/data/models/user_login_request.dart';
import 'package:flutter_hortifruti/app/data/services/auth/repository.dart';
import 'package:flutter_hortifruti/app/data/services/config/storage/service.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  final AuthRepository _repository;

  final _storageService = Get.find<StorageService>();
  final user = Rxn<UserModel>();
  bool get isLogged => user.value != null;

  AuthService(this._repository);

  @override
  void onInit() async {
    await _getUser();
    super.onInit();
  }

  Future<void> login(UserLoginRequestModel userRequest) async {
    final userResponse = await _repository.login(userRequest);
    await _storageService.saveToken(userResponse.token);
    await _getUser();
  }

  Future _getUser() {
    return _repository.getUser().then((value) {
      user.value = value;
    });
  }
}
