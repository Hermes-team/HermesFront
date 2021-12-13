class Friend {
  String uniqid;
  String nickname;
  int tag;

  Friend({required this.uniqid, required this.nickname, required this.tag});

  Friend.fromJson(Map<String, dynamic> json):
        uniqid = json["uniqid"],
        nickname = json["nickname"],
        tag = json["tag"];
}