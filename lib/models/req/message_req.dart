class MessageReq {
  String msg;
  String uniqid;

  MessageReq({required this.msg, required this.uniqid});

  Map<String, dynamic> toJson() => {
    'message': msg,
    'uniqid': uniqid
  };
}