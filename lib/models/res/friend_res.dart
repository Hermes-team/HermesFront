class Friend {
  String uniqid;
  String nickname;
  String? img;
  int tag;

  Friend({required this.uniqid, required this.nickname, required this.tag, required this.img});

  Friend.fromJson(Map<String, dynamic> json):
        uniqid = json["uniqid"],
        nickname = json["nickname"],
        img = json["img"],
        tag = json["tag"];
}