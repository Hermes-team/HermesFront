class SocketAuthReq{
  String selector;
  String token;
  
  SocketAuthReq({
    required this.selector,
    required this.token
  });

  Map<String, dynamic> toJson() => {
    'selector': selector,
    'token': token,
  };
}
