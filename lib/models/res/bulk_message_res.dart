class BulkMessageRes {
  List<dynamic>? messages;
  String? server;

  BulkMessageRes({this.messages, this.server});

  BulkMessageRes.fromJson(Map<String, dynamic> json):
      messages = json["messages"],
      server = json["server"];
}