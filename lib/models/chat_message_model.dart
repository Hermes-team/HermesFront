import 'package:giphy_picker/giphy_picker.dart';

class ChatMessage {
  String messageContent;
  String messageType;
  String uuid;
  bool isGiph;

  ChatMessage({required this.messageContent, required this.messageType, required this.uuid, required this.isGiph});
}
