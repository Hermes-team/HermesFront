class GroupChatMessage {
  String messageContent;
  String messageType;
  bool viewImg = true;
  String owner;
  String imgs;

  GroupChatMessage({required this.messageContent, required this.messageType, required this.owner, required this.imgs});
}
