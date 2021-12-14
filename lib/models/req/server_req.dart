class ServerReq {
  String server;

  ServerReq({required this.server});


  Map<String, dynamic> toJson() {
    return {
      'server': server,
    };
  }
}