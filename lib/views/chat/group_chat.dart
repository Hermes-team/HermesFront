import 'package:flutter/material.dart';
import 'package:front/models/group_chat_message_model.dart';

class GroupChatPage extends StatefulWidget {
  final String name;
  final String img;

  const GroupChatPage({Key? key, required this.name, required this.img}) : super(key: key);

  @override
  _GroupChatPageState createState() => _GroupChatPageState();
}

class _GroupChatPageState extends State<GroupChatPage> {
  late List<GroupChatMessage> filtedMsg;

  List<GroupChatMessage> messages = [
    GroupChatMessage(messageContent: "last sms", messageType: "sender", imgs: "assets/imgs/p2.png", owner: 'Liam'),
    GroupChatMessage(messageContent: "aaa aaa aaa", messageType: "sender", imgs: "assets/imgs/p2.png", owner: 'Liam'),
    GroupChatMessage(messageContent: "bbbb", messageType: "sender", imgs: "assets/imgs/p2.png", owner: 'Liam'),
    GroupChatMessage(
        messageContent: "ababababab abababab abababb ababbb abababab abababa ababbab ab",
        messageType: "sender",
        imgs: "assets/imgs/p3.png",
        owner: 'Olivia'),
    GroupChatMessage(messageContent: "aba", messageType: "receiver", imgs: '', owner: ''),
    GroupChatMessage(messageContent: "aaa aaa aaa", messageType: "sender", imgs: "assets/imgs/p4.png", owner: 'Oscar'),
    GroupChatMessage(messageContent: "bbbb", messageType: "sender", imgs: "assets/imgs/p4.png", owner: 'Oscar'),
    GroupChatMessage(
        messageContent: "ababababab abababab abababb ababbb abababab abababa ababbab ab",
        messageType: "receiver",
        imgs: '',
        owner: ''),
    GroupChatMessage(messageContent: "aba", messageType: "sender", imgs: "assets/imgs/p2.png", owner: 'Liam'),
    GroupChatMessage(messageContent: "aaa aaa aaa", messageType: "receiver", imgs: '', owner: ''),
    GroupChatMessage(messageContent: "aaa aaa aaa", messageType: "receiver", imgs: '', owner: ''),
    GroupChatMessage(messageContent: "aaa aaa aaa", messageType: "receiver", imgs: '', owner: ''),
    GroupChatMessage(messageContent: "bbbb", messageType: "sender", imgs: "assets/imgs/p2.png", owner: 'Liam'),
    GroupChatMessage(
        messageContent:
            "a bbbb bbbb bbbb bbbb bbbb bbbb bbbb bbbb bbbb  bbbb bbbb bbbb bbbb bbbb  bbbb bbbb bbb bbbb bbbb bbbb bbbb bbbb  bbbb bbbb bbbb bbbb bbbb  bbbb bbbb bbbb bbbb bbbb  bbbb bbbb bbbb bbbb bbbb",
        messageType: "sender",
        imgs: "assets/imgs/p2.png",
        owner: 'Liam'),
    GroupChatMessage(messageContent: "aba", messageType: "sender", imgs: "assets/imgs/p2.png", owner: 'Liam'),
    GroupChatMessage(messageContent: "aaa aaa aaa", messageType: "sender", imgs: "assets/imgs/p2.png", owner: 'Liam'),
    GroupChatMessage(messageContent: "bbbb", messageType: "sender", imgs: "assets/imgs/p4.png", owner: 'Oscar'),
    GroupChatMessage(
        messageContent: "a bbbb bbbb bbbb bbbb bbbb  bbbb bbbb bbbb bbbb bbbb  bbbb bbbb bbbb bbbb bbbb  bbbb bbbb  bbbb bbbb ",
        messageType: "receiver",
        imgs: '',
        owner: ''),
    GroupChatMessage(messageContent: "first sms", messageType: "sender", imgs: "assets/imgs/p3.png", owner: 'Olivia'),
  ];

  bool isExpanded = false;

  RelativeRect buttonMenuPosition(BuildContext context) {
    final RenderBox bar = context.findRenderObject() as RenderBox;

    Offset offset = Offset.zero;
    final RelativeRect position = RelativeRect.fromRect(
        Rect.fromPoints(bar.size.bottomRight(offset), bar.size.bottomRight(offset) + const Offset(40, 10)), Rect.zero);

    return position;
  }

  List<GroupChatMessage> filterUsers(List<GroupChatMessage> list) {
    list.asMap().forEach((index, msg) {
      if (msg.messageType == "receiver") return;
      if (index == 0 && list.length > 1 && msg.owner == list[index + 1].owner) {
        return;
      } else if (index < list.length && msg.owner == list[index - 1].owner) {
        msg.viewImg = false;
      } else if (index == list.length && msg.owner != list[index - 1].owner) {
        msg.viewImg = false;
      } else {
        return;
      }
    });

    return list;
  }

  @override
  Widget build(BuildContext context) {
    filtedMsg = filterUsers(messages);
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
                reverse: true,
                itemCount: messages.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 7, bottom: 7),
                // physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Row(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: messages[index].messageType == "sender" ? MainAxisAlignment.start : MainAxisAlignment.end,
                    children: [
                      (filtedMsg[index].messageType == "sender" && filtedMsg[index].viewImg)
                          ? Container(
                              margin: const EdgeInsets.symmetric(horizontal: 9.0),
                              child: CircleAvatar(
                                child: Image.asset(filtedMsg[index].imgs),
                              ),
                            )
                          : Container(
                              margin: const EdgeInsets.symmetric(horizontal: 14.0),
                              child: const SizedBox(
                                width: 30,
                              ),
                            ),
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.only(right: 15, top: 3, bottom: 3),
                          child: Align(
                            alignment: (filtedMsg[index].messageType == "receiver" ? Alignment.topRight : Alignment.topLeft),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(index < filtedMsg.length - 1 &&
                                          filtedMsg[index].owner == filtedMsg[index + 1].owner &&
                                          filtedMsg[index].messageType != "receiver"
                                      ? 5
                                      : 16),
                                  topRight: Radius.circular(index < filtedMsg.length - 1 &&
                                          filtedMsg[index].owner == filtedMsg[index + 1].owner &&
                                          filtedMsg[index].messageType == "receiver"
                                      ? 5
                                      : 16),
                                  bottomLeft: Radius.circular(index > 0 &&
                                          filtedMsg[index].owner == filtedMsg[index - 1].owner &&
                                          filtedMsg[index].messageType != "receiver"
                                      ? 5
                                      : 16),
                                  bottomRight: Radius.circular(index > 0 &&
                                          filtedMsg[index].owner == filtedMsg[index - 1].owner &&
                                          filtedMsg[index].messageType == "receiver"
                                      ? 5
                                      : 16),
                                ),
                                color: (filtedMsg[index].messageType == "receiver" ? const Color(0xFF5A7059) : const Color(0xFF182226)),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                              child: Text(
                                filtedMsg[index].messageContent,
                                style: const TextStyle(fontSize: 15, color: Color(0xFFc9c9c9)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
                    const Expanded(
                      child: TextField(
                        style: TextStyle(color: Color(0xFFc9c9c9)),
                        decoration: InputDecoration(
                            hintText: "Message...", hintStyle: TextStyle(color: Color(0xFFc9c9c9)), border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {},
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
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Positioned(
      bottom: 6,
      right: 15,
      child: GestureDetector(
        onTap: () {
          isExpanded = !isExpanded;
          setState(() {});
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
          child: isExpanded
              ? Column(
                  children: [
                    const SizedBox(height: 10),
                    _getImageItem("assets/icons/image.png"),
                    _getImageItem("assets/icons/smile.png"),
                    _getImageItem("assets/icons/gif.png"),
                    _getImageItem("assets/icons/sticker.png"),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.arrow_drop_down_rounded, color: Colors.black),
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
