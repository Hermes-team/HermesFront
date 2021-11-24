class MessageReq {
  String msg;

  MessageReq({required this.msg});

  Map<String, dynamic> toJson() => {
    'message': msg,
  };
}