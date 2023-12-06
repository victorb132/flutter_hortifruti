class UserProfileRequestModel {
  String name;
  String email;
  String phone;
  String? password;

  UserProfileRequestModel({
    required this.name,
    required this.email,
    required this.phone,
    this.password,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phone': phone,
        if (password != null && password!.isNotEmpty) 'password': password,
      };
}
