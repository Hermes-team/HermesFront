class ChannelReq {
  String channel;
  String server;

  ChannelReq({required this.channel, required this.server});


  Map<String, dynamic> toJson() {
    return {
      'channel': channel,
      'server': server,
    };
  }
}