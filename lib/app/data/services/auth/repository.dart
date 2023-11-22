import 'package:flutter_hortifruti/app/data/models/user.dart';
import 'package:flutter_hortifruti/app/data/models/user_login_request.dart';
import 'package:flutter_hortifruti/app/data/models/user_login_response.dart';
import 'package:flutter_hortifruti/app/data/provider/api.dart';

class AuthRepository {
  final Api _api;

  AuthRepository(this._api);

  Future<UserLoginResponseModel> login(UserLoginRequestModel user) =>
      _api.login(user);

  Future<UserModel> getUser() => _api.getUser();
}
