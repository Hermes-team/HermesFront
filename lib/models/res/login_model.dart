class LoginRes{
  bool success;
  String? msg;
  String? token;
  String? selector;

  LoginRes({
    required this.success,
  });

  LoginRes.fromJson(Map<String, dynamic> json):
        success = json['success'],
        msg = json['msg'],
        token = json['token'],
        selector = json['selector'];

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'msg': msg,
      'token': token,
      'selector': selector,
    };
  }
}
