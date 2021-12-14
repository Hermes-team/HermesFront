class ServerReq {
  String channel;
  String server;

  ServerReq({required this.channel, required this.server});


  Map<String, dynamic> toJson() {
    return {
      'channel': channel,
      'server': server,
    };
  }
}