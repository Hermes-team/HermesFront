class MessageRes {
  String? message;
  String? server;
  String? user;
  int? time;
  String? timezone;
  String? userID;
  String? uuid;
  bool? linkFlag;

  MessageRes({
    this.message,
    this.user,
    this.server,
    this.time,
    this.timezone,
    this.userID,
    this.uuid,
    this.linkFlag
  });

  MessageRes.fromJson(Map<String, dynamic> json):
    message = json['message'],
    server = json['server'],
    user = json['user'],
    time = json['time'],
    timezone = json['timezone'],
    userID = json['userID'],
    linkFlag = json['linkFlag'],
    uuid = json['uuid'];
}