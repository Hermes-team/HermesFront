class MessageReq {
  String msg;
  String server;

  MessageReq({required this.msg, required this.server});

  Map<String, dynamic> toJson() => {
    'message': msg,
    'server': server
  };
}