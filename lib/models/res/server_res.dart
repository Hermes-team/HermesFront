class ServerRes {
  List<Server>? servers;

  ServerRes({
    this.servers,
  });

  ServerRes.fromJson(Map<String, dynamic> json):
        servers = json['servers'];
}

class Server {
  String? name;
  String? lastMessage;
  String? id;

  Server({ this.name, this.lastMessage, this.id });

  Server.fromJson(Map<String, dynamic> json):
    name = json['name'],
    lastMessage = json['lastMessage'],
    id = json['id'];
}