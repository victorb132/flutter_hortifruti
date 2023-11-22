class UserLoginResponseModel {
  String token;
  String expiresAt;

  UserLoginResponseModel({
    required this.token,
    required this.expiresAt,
  });

  factory UserLoginResponseModel.fromJson(Map<String, dynamic> json) {
    return UserLoginResponseModel(
      token: json['token'],
      expiresAt: json['expires'],
    );
  }
}
