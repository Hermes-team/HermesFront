class BulkMessageRes {
  List<dynamic>? messages;
  String? channel;

  BulkMessageRes({this.messages, this.channel});

  BulkMessageRes.fromJson(Map<String, dynamic> json):
      messages = json["messages"],
      channel = json["channel"];
}