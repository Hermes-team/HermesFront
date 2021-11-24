class ServerRes {
  String? name;
  String? lastMessage;
  String? id;

  ServerRes({ this.name, this.lastMessage, this.id });

  ServerRes.fromJson(Map<String, dynamic> json):
    name = json['name'],
    lastMessage = json['lastMessage'],
    id = json['id'];
}