class RegisterModel{
  String email;
  String nickname;
  String password;

  RegisterModel({
    required this.email,
    required this.nickname,
    required this.password
  });

  RegisterModel.fromJson(Map<String, dynamic> json):
        email = json['email'],
        nickname = json['nickname'],
        password = json['password'];

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'nickname': nickname,
      'password': password,
    };
  }
}
