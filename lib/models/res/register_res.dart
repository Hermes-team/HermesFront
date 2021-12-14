class RegisterRes {
  bool success;
  String? msg;
  String? token;
  String? selector;
  String? uniqid;
  String? nickname;
  int? tag;
  String? email;

  RegisterRes({
    required this.success,
  });

  RegisterRes.fromJson(Map<String, dynamic> json):
        success = json['success'],
        msg = json['msg'],
        token = json['token'],
        selector = json['selector'],
        uniqid = json['uniqid'],
        nickname = json['nickname'],
        email = json['email'],
        tag = json['tag'];

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'msg': msg,
      'token': token,
      'selector': selector,
      'uniqid': uniqid,
      'nickname': nickname,
      'tag': tag,
      'email': email
    };
  }
}
