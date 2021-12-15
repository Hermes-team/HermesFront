class MessageReq {
  String msg;
  String server;
  bool linkFlag;

  MessageReq({required this.msg, required this.server, required this.linkFlag});

  Map<String, dynamic> toJson() => {
    'message': msg,
    'server': server,
    'linkFlag': linkFlag
  };
}