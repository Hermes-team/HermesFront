import 'dart:async';
import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:front/models/chat_message_model.dart';
import 'package:front/models/req/channel_req.dart';
import 'package:front/models/req/message_req.dart';
import 'package:front/models/res/bulk_message_res.dart';
import 'package:front/models/res/message_res.dart';
import 'package:front/services/globals.dart';

class PrivateChatPage extends StatefulWidget {
  final String name;
  final String img;

  const PrivateChatPage({Key? key, required this.name, required this.img}) : super(key: key);

  @override
  _PrivateChatPageState createState() => _PrivateChatPageState();
}

class _PrivateChatPageState extends State<PrivateChatPage> {

  final TextEditingController _msgController = TextEditingController();
  final _scrollController = ScrollController();
  final LinkedHashSet<ChatMessage> _messages = LinkedHashSet<ChatMessage>();
  // ignore: prefer_typing_uninitialized_variables
  late var msgListener;

  addMsgFromServer(MessageRes messagePayload) {
    if (messagePayload.userID == userUniqid) {
      var mess = _messages.firstWhere((element) => element.messageContent == messagePayload.message && element.uuid == "", orElse: () => ChatMessage(messageContent: "", messageType: "", uuid: ""));
      if (mess.messageType == "") {
        return;
      }
      mess.uuid = messagePayload.uuid!;
    } else {
      var chatMsg = ChatMessage(messageContent: messagePayload.message!, messageType: "receiver", uuid: messagePayload.uuid!);
      _messages.add(chatMsg);
    }
    if (mounted) {
      setState(() {});
      scrollDown();
    }
  }

  loadOldMessage(MessageRes messagePayload) {
    var messageType = messagePayload.userID == userUniqid ? "sender" : "receiver";
    var chatMsg = ChatMessage(messageContent: messagePayload.message!, messageType: messageType, uuid: messagePayload.uuid!);
    _messages.add(chatMsg);
    if (mounted) {
      setState(() {});
      scrollDown();
    }
  }

  sendMsg() {
    var msgData = MessageReq(msg: _msgController.text);
    if (msgData.msg == "") return;
    var chatMsg = ChatMessage(messageContent: msgData.msg, messageType: "sender", uuid: "");
    _messages.add(chatMsg);
    socket?.emit('message', msgData);
    _msgController.clear();
    if (mounted) {
      setState(() {});
      scrollDown();
    }
  }

  @override
  void initState() {
    msgListener = addMsgFromServer;

    socket!.on("message", (data) {
      var parsedMessage = MessageRes.fromJson(data);
      addMsgFromServer(parsedMessage);
    });

    socket!.on('channel messages', (data) {
      var bulk = BulkMessageRes.fromJson(data);
      for (var message in bulk.messages!) {
        var parsedMessage = MessageRes.fromJson(message);
        loadOldMessage(parsedMessage);
        Timer(
          const Duration(milliseconds: 50),
          () => scrollDown()
        );
      }
    });

    socket!.emit('get messages', ChannelReq(channel: "GENERAL_CHANNEL", server: "GENERAL_SERVER"));
    super.initState();
  }

  scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent * 1.02,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutExpo,
    );
  }

  bool isExpanded = false;

  RelativeRect buttonMenuPosition(BuildContext context) {
    final RenderBox bar = context.findRenderObject() as RenderBox;
    Offset offset = Offset.zero;
    final RelativeRect position =
        RelativeRect.fromRect(Rect.fromPoints(bar.size.bottomRight(offset)  , bar.size.bottomRight(offset) + const Offset(40, 10)), Rect.zero);

    return position;
  }

  bool isReceiver(String type) {
    return type == "receiver";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF223239),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF182226),
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
                CircleAvatar(
                  maxRadius: 20,
                  child: Image.asset(
                    widget.img,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.name,
                        style: const TextStyle(color: Color(0xFFc9c9c9), fontSize: 16, fontWeight: FontWeight.w100),
                      ),
                    ],
                  ),
                ),
                // const Icon(
                //   Icons.settings,
                //   color: Color(0xff8D8D8D),
                // ),
                PopupMenuButton<String>(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  color: const Color(0xff213339),
                  padding: const EdgeInsets.all(0),
                  onSelected: null,
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(
                        child: Row(
                          children: const [
                            Image(
                              image: AssetImage("assets/icons/search.png"),
                              // height: 15,
                              width: 22,
                            ),
                            // Icon(Icons.search),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Search", style: TextStyle(fontSize: 14, color: Colors.white)),
                          ],
                        ),
                        value: "Search",
                      ),
                      PopupMenuItem(
                        child: Row(
                          children: const [
                            Image(
                              image: AssetImage("assets/icons/volume-mute.png"),
                              // height: 15,
                              width: 25,
                            ),
                            //Icon(Icons.search),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Mute", style: TextStyle(fontSize: 14, color: Colors.white)),
                          ],
                        ),
                        value: "Mute",
                      ),
                      PopupMenuItem(
                        child: Row(
                          children: const [
                            Image(
                              image: AssetImage("assets/icons/trash.png"),
                              // height: 15,
                              width: 26,
                            ),
                            //Icon(Icons.search),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Delete chat", style: TextStyle(fontSize: 14, color: Colors.white)),
                          ],
                        ),
                        value: "Delete chat",
                      ),
                    ];
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                itemCount: _messages.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 7, bottom: 7),
                itemBuilder: (context, index) {
                  var msg = _messages.elementAt(index);
                  var receiver = isReceiver(msg.messageType);
                  return Container(
                    padding: EdgeInsets.only(
                        left: receiver ? 15 : 45,
                        right: receiver ? 45 : 15,
                        top: 3,
                        bottom: 3
                    ),
                    child: Align(
                      alignment: (receiver ? Alignment.topLeft : Alignment.topRight),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(16),
                            topRight: const Radius.circular(16),
                            bottomLeft: Radius.circular(receiver ? 0 : 12),
                            bottomRight: Radius.circular(receiver ? 12 : 0),
                          ),
                          color: (receiver ? const Color(0xFF182226) : msg.uuid == "" ? const Color(0x40294a2d) : const Color(0xFF5A7059)),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: Text(
                          msg.messageContent,
                          style: const TextStyle(fontSize: 15, color: Color(0xFFc9c9c9)),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10, right: 15),
                height: 60,
                width: double.infinity,
                color: const Color(0xFF182226),
                child: Row(
                  children: <Widget>[
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextField(
                        onTap: () {
                          scrollDown();
                        },
                        controller: _msgController,
                        style: const TextStyle(color: Color(0xFFc9c9c9)),
                        decoration: const InputDecoration(
                            hintText: "Message...", hintStyle: TextStyle(color: Color(0xFFc9c9c9)), border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        sendMsg();
                      },
                      onLongPress: () {
                        final RelativeRect position = buttonMenuPosition(context);
                        showMenu(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(60.0),
                            ),
                          ),
                          color: const Color(0xFF5A7059),
                          position: position,
                          items: [
                            PopupMenuItem(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Image(
                                    image: AssetImage("assets/icons/image.png"),
                                    height: 30,
                                    width: 30,
                                  ),
                                  // // Icon(Icons.search),
                                ],
                              ),
                              value: "Search",
                            ),
                            PopupMenuItem(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Image(
                                    image: AssetImage("assets/icons/smile.png"),
                                    height: 30,
                                    width: 30,
                                  ),
                                  // // Icon(Icons.search),
                                ],
                              ),
                              value: "Search",
                            ),
                            PopupMenuItem(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Image(
                                    image: AssetImage("assets/icons/gif.png"),
                                    height: 30,
                                    width: 30,
                                  ),
                                  // // Icon(Icons.search),
                                ],
                              ),
                              value: "Search",
                            ),
                            PopupMenuItem(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Image(
                                    image: AssetImage("assets/icons/sticker.png"),
                                    height: 30,
                                    width: 30,
                                  ),
                                  // // Icon(Icons.search),
                                ],
                              ),
                              value: "Search",
                            ),
                            PopupMenuItem(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Image(
                                    image: AssetImage("assets/icons/triangle.png"),
                                    height: 25,
                                    width: 25,
                                  ),
                                  // // Icon(Icons.search),
                                ],
                              ),
                              value: "Search",
                            ),
                          ],
                        );
                      },
                      child: const CircleAvatar(
                        backgroundColor: Color(0xFF5A7059),
                        child: Icon(
                          Icons.send,
                          color: Color(0xFF182226),
                          size: 18,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GetMediaWidget extends StatefulWidget {
  const GetMediaWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<GetMediaWidget> createState() => _GetMediaWidgetState();
}

class _GetMediaWidgetState extends State<GetMediaWidget> {
  bool isExpanded = false;
  late double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery
        .of(context)
        .size
        .height;
    width = MediaQuery
        .of(context)
        .size
        .width;

    return Positioned(
      bottom: 6,
      right: 15,
      child: GestureDetector(
        onTap: () {
          isExpanded = !isExpanded;
          if (mounted) {
            setState(() {});
          }
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(isExpanded ? 60 : 30.0),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5.0,
                  spreadRadius: 8.0,
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(0.0, 2.0),
                ),
              ],
              color: Colors.blue),
          child: isExpanded ? Column(
            children: [
              const SizedBox(height: 10),
              _getImageItem("assets/icons/image.png"),
              _getImageItem("assets/icons/smile.png"),
              _getImageItem("assets/icons/gif.png"),
              _getImageItem("assets/icons/sticker.png"),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_drop_down_rounded,
                    color: Colors.black),
              ),
              const SizedBox(height: 10),
            ],
          )
              : const Center(
              child: IconButton(
                icon: Icon(
                  Icons.play_arrow,
                  color: Colors.black,
                ),
                onPressed: null,
              )),
        ),
      ),
    );
  }

  Padding _getImageItem(String image) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(image, width: 30, height: 25),
    );
  }
}
