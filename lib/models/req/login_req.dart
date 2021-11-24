class LoginReq{
  String email;
  String password;

  LoginReq({
     required this.email,
     required this.password
  });

  LoginReq.fromJson(Map<String, dynamic> json):
        email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
