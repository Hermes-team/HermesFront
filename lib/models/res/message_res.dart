class MessageRes {
  String? message;
  String? channel;
  String? server;
  String? user;
  int? time;
  String? timezone;
  String? userID;
  String? uuid;

  MessageRes({
    this.message,
    this.channel,
    this.user,
    this.server,
    this.time,
    this.timezone,
    this.userID,
    this.uuid
  });

  MessageRes.fromJson(Map<String, dynamic> json):
    message = json['message'],
    channel = json['channel'],
    server = json['server'],
    user = json['user'],
    time = json['time'],
    timezone = json['timezone'],
    userID = json['userID'],
    uuid = json['uuid'];
}