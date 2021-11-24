class ChatMessage {
  String messageContent;
  String messageType;
  String? uuid;

  ChatMessage({required this.messageContent, required this.messageType, this.uuid});
}
