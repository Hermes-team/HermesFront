class LoginRes{
  bool success;
  String? msg;
  String? token;
  String? selector;
  String? uniqid;
  String? nickname;
  String? tag;

  LoginRes({
    required this.success,
  });

  LoginRes.fromJson(Map<String, dynamic> json):
    success = json['success'],
    msg = json['msg'],
    token = json['token'],
    selector = json['selector'],
    uniqid = json['uniqid'],
    nickname = json['nickname'],
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
    };
  }
}
