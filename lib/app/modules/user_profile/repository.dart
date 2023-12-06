import 'package:flutter_hortifruti/app/data/models/user.dart';
import 'package:flutter_hortifruti/app/data/models/user_profile_request.dart';
import 'package:flutter_hortifruti/app/data/provider/api.dart';

class UserProfileRepository {
  final Api _api;

  UserProfileRepository(this._api);

  Future<UserModel> getUser() => _api.getUser();

  Future<UserModel> putUser(UserProfileRequestModel userProfileRequest) =>
      _api.putUser(userProfileRequest);
}
