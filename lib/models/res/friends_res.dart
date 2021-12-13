class Friends {
  bool success;
  List<dynamic>? friends;
  List<dynamic>? pendingRequests;

  Friends({required this.success, required this.friends, required this.pendingRequests});

  Friends.fromJson(Map<String, dynamic> json):
        success = json["success"],
        friends = json["friends"],
        pendingRequests = json["pendingRequests"];
}