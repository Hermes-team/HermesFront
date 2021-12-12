class RegisterRes {
  bool success;
  String? msg;
  String? token;
  String? selector;

  RegisterRes({
    required this.success,
  });

  RegisterRes.fromJson(Map<String, dynamic> json):
        success = json['success'],
        msg = json['msg'],
        token = json['token'],
        selector = json['selector'];
}
