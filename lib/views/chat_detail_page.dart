import 'package:flutter/material.dart';
import 'package:front/models/chat_message_model.dart';
import 'package:front/models/req/message_model.dart';
import 'package:front/models/res/message_model.dart';
import 'package:front/services/globals.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({Key? key}) : super(key: key);

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final TextEditingController _msgController = TextEditingController();
  final List<ChatMessage> _messages = [];
  late var msgListener;

  addMsgFromServer(data) {
    var messageData = MessageRes.fromJson(data);
    var chatMsg = ChatMessage(messageContent: messageData.message!, messageType: "receiver");
    _messages.add(chatMsg);
    setState(() {});
  }

  @override
  void initState() {
    msgListener = addMsgFromServer;
    socket!.on("message", (data) => addMsgFromServer(data));
    super.initState();
  }

  @override
  void dispose() {
    socket!.off("message", msgListener);
    super.dispose();
  }

  sendMsg() {
    var msgData = MessageReq(msg: _msgController.text);
    var chatMsg = ChatMessage(messageContent: msgData.msg, messageType: "sender");
    _messages.add(chatMsg);
    socket?.emit('message', msgData);
    _msgController.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF223239),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff213339),
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(0xff8D8D8D),
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "<https://randomuser.me/api/portraits/men/5.jpg>"),
                  maxRadius: 20,
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Kriss Benwat",
                        style: TextStyle(
                            color: Color(0xffEBEBEB),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Online",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.settings,
                  color: Color(0xff8D8D8D),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: _messages.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding:
                    const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                child: Align(
                  alignment: (_messages[index].messageType == "receiver"
                      ? Alignment.topLeft
                      : Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(16),
                        topRight: const Radius.circular(16),
                        bottomLeft: Radius.circular(
                            _messages[index].messageType == "receiver" ? 0 : 12),
                        bottomRight: Radius.circular(
                            _messages[index].messageType == "receiver" ? 12 : 0),
                      ),
                      color: (_messages[index].messageType == "receiver"
                          ? const Color(0xff2A454e)
                          : const Color(0xFF294a2d)),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      _messages[index].messageContent,
                      style: const TextStyle(fontSize: 15, color: Color(0xffc9c9c9)),
                    ),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: const Color(0xff2A454e),
              child: Row(
                children: <Widget>[
                  // GestureDetector(
                  //   onTap: (){
                  //   },
                  //   child: Container(
                  //     height: 30,
                  //     width: 30,
                  //     decoration: BoxDecoration(
                  //       color: Colors.lightBlue,
                  //       borderRadius: BorderRadius.circular(30),
                  //     ),
                  //     child: Icon(Icons.add, color: Colors.white, size: 20, ),
                  //   ),
                  // ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _msgController,
                      decoration: const InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Color(0xFFc9c9c9)),
                          border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () => sendMsg(),
                    child: const Icon(
                      Icons.send,
                      color: Color(0xff213339),
                      size: 18,
                    ),
                    backgroundColor: const Color(0xffaacaa8),
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
