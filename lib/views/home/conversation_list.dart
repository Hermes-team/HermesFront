import 'package:flutter/material.dart';
import 'package:front/views/chat/group_chat.dart';
import 'package:front/views/chat/private_chat.dart';

class ConversationList extends StatefulWidget {
  final String name;
  final String messageText;
  final String img;
  final String time;
  final bool isMessageRead;
  final bool isGroup;
  final String uniqid;
  final Function getServers;

  const ConversationList({
    Key? key,
    required this.name,
    required this.messageText,
    required this.img,
    required this.time,
    required this.isMessageRead,
    required this.isGroup,
    required this.uniqid,
    required this.getServers
  }) : super(key: key);

  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {

  @override
  void dispose() {
    widget.getServers();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.isGroup) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return GroupChatPage(name: widget.name, img: widget.img);
          }));
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return PrivateChatPage(name: widget.name, img: widget.img, serversUniqid: widget.uniqid);
          }));
        }
      },

      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.img),
                    maxRadius: 30,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.name,
                            style: const TextStyle(fontSize: 16, color: Color(0xffEBEBEB)),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            widget.messageText,
                            style: TextStyle(
                                fontSize: 13,
                                color: const Color(0xff8d8d8d),
                                fontWeight: widget.isMessageRead ? FontWeight.bold : FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              widget.time,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: widget.isMessageRead ? FontWeight.bold : FontWeight.normal,
                  color: const Color(0xff8d8d8d)),
            ),
          ],
        ),
      ),
    );
  }
}
