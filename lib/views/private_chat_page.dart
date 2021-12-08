import 'package:flutter/material.dart';
import 'package:front/models/chat_message_model.dart';

class PrivateChatPage extends StatefulWidget {
  @override
  _PrivateChatPageState createState() => _PrivateChatPageState();
}

class _PrivateChatPageState extends State<PrivateChatPage> {
  late String name = "Kriss";
  late String img = "assets/imgs/p5.png";

  List<ChatMessage> messages = [
    ChatMessage(messageContent: "aba", messageType: "sender"),
    ChatMessage(messageContent: "aaa aaa aaa", messageType: "receiver"),
    ChatMessage(messageContent: "bbbb", messageType: "receiver"),
    ChatMessage(messageContent: "ababababab abababab abababb ababbb abababab abababa ababbab ab", messageType: "sender"),
    ChatMessage(messageContent: "aba", messageType: "receiver"),
    ChatMessage(messageContent: "aaa aaa aaa", messageType: "sender"),
    ChatMessage(messageContent: "bbbb", messageType: "sender"),
    ChatMessage(messageContent: "ababababab abababab abababb ababbb abababab abababa ababbab ab", messageType: "receiver"),
    ChatMessage(messageContent: "aba", messageType: "sender"),
    ChatMessage(messageContent: "aaa aaa aaa", messageType: "receiver"),
    ChatMessage(messageContent: "bbbb", messageType: "receiver"),
    ChatMessage(
        messageContent:
            "a bbbb bbbb bbbb bbbb bbbb  bbbb bbbb bbbb bbbb bbbb  bbbb bbbb bbbb bbbb bbbb  bbbb bbbb bbbb bbbb bbbb  bbbb bbbb bbbb bbbb bbbb",
        messageType: "sender"),
    ChatMessage(messageContent: "aba", messageType: "receiver"),
    ChatMessage(messageContent: "aaa aaa aaa", messageType: "sender"),
    ChatMessage(messageContent: "bbbb", messageType: "sender"),
    ChatMessage(
        messageContent: "a bbbb bbbb bbbb bbbb bbbb  bbbb bbbb bbbb bbbb bbbb  bbbb bbbb bbbb bbbb bbbb  bbbb bbbb  bbbb bbbb ",
        messageType: "receiver"),
  ];

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
                    img,
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
                        name,
                        style: const TextStyle(color: Color(0xffEBEBEB), fontSize: 16, fontWeight: FontWeight.w100),
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
                  padding: EdgeInsets.all(0),
                  onSelected: (value) {
                    print(value);
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(
                        child: Row(
                          children: const [
                            Image(
                              image: AssetImage("assets/icons/search.png"),
                              height: 15,
                            ),
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
                              height: 15,
                            ),
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
                              height: 15,
                            ),
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
                padding: EdgeInsets.only(top: 7, bottom: 7),
                // physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(
                        left: messages[index].messageType == "receiver" ? 15 : 45,
                        right: messages[index].messageType == "receiver" ? 45 : 15,
                        top: 3,
                        bottom: 3),
                    child: Align(
                      alignment: (messages[index].messageType == "receiver" ? Alignment.topLeft : Alignment.topRight),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                            bottomLeft: Radius.circular(messages[index].messageType == "receiver" ? 0 : 12),
                            bottomRight: Radius.circular(messages[index].messageType == "receiver" ? 12 : 0),
                          ),
                          color: (messages[index].messageType != "receiver" ? Color(0xff2A454e) : Color(0xFF182226)),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Text(
                          messages[index].messageContent,
                          style: TextStyle(fontSize: 15, color: Color(0xffc9c9c9)),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF182226),
                //borderRadius: BorderRadius.circular(32.0),
              ),
              padding: const EdgeInsets.only(left: 15, top: 7, right: 10, bottom: 7),
              //margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
              child: Form(
                // key: _formKey,
                child: TextFormField(
                  // validator: (value) {
                  //   if (value.isEmpty || value == null)
                  //     return "Message empty";
                  //   else
                  //     return null;
                  // },
                  // controller: _msgTxtController,
                  style: TextStyle(color: Colors.white),
                  scrollPadding: EdgeInsets.all(8.0),
                  decoration: InputDecoration(
                      hintText: "Message",
                      hintStyle: TextStyle(color: Colors.white),
                      contentPadding: EdgeInsets.all(12.0),
                      border: InputBorder.none,
                      fillColor: const Color(0xFF182226),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          // if (_formKey.currentState.validate()) {
                          //   setState(() {
                          //     received_msg.add(Message(
                          //         type: 1, msgs: _msgTxtController.text));
                          //   });
                          // }
                        },
                        // onLongPress: () {
                        //   final RelativeRect position =
                        //   buttonMenuPosition(context);
                        //   showMenu(
                        //     context: context,
                        //     color: kColorD,
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.all(
                        //         Radius.circular(40.0),
                        //       ),
                        //     ),
                        //     position: position,
                        //     items: [
                        //       PopupMenuItem(
                        //         child: Row(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           crossAxisAlignment: CrossAxisAlignment.center,
                        //           children: [
                        //             Container(
                        //               width: getDeviceWidth(context, 0.1),
                        //               height: getDeviceWidth(context, 0.1),
                        //               child:
                        //               Image.asset('assets/icons/image.png'),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //       PopupMenuItem(
                        //         child: Row(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           crossAxisAlignment: CrossAxisAlignment.center,
                        //           children: [
                        //             Container(
                        //               width: getDeviceWidth(context, 0.1),
                        //               height: getDeviceWidth(context, 0.1),
                        //               child:
                        //               Image.asset('assets/icons/smile.png'),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //       PopupMenuItem(
                        //         child: Row(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           crossAxisAlignment: CrossAxisAlignment.center,
                        //           children: [
                        //             Container(
                        //               width: getDeviceWidth(context, 0.1),
                        //               height: getDeviceWidth(context, 0.1),
                        //               child:
                        //               Image.asset('assets/icons/gif.png'),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //       PopupMenuItem(
                        //         child: Row(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           crossAxisAlignment: CrossAxisAlignment.center,
                        //           children: [
                        //             Container(
                        //               width: getDeviceWidth(context, 0.1),
                        //               height: getDeviceWidth(context, 0.1),
                        //               child: Image.asset(
                        //                   'assets/icons/sticker.png'),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   );
                        // },
                        child: const CircleAvatar(
                          backgroundColor: Color(0xff2A454e),
                          child: Icon(
                            Icons.send,
                            color: Color(0xFF182226),
                          ),
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),

      // Stack(
      //   children: <Widget>[
      //     ListView.builder(
      //       // reverse: true,
      //       itemCount: messages.length,
      //       shrinkWrap: true,
      //       padding: EdgeInsets.only(top: 10, bottom: 10),
      //       // physics: NeverScrollableScrollPhysics(),
      //       itemBuilder: (context, index) {
      //         return Container(
      //           padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
      //           child: Align(
      //             alignment: (messages[index].messageType == "receiver" ? Alignment.topLeft : Alignment.topRight),
      //             child: Container(
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.only(
      //                   topLeft: Radius.circular(16),
      //                   topRight: Radius.circular(16),
      //                   bottomLeft: Radius.circular(messages[index].messageType == "receiver" ? 0 : 12),
      //                   bottomRight: Radius.circular(messages[index].messageType == "receiver" ? 12 : 0),
      //                 ),
      //                 color: (messages[index].messageType == "receiver" ? Color(0xff2A454e) : Color(0xFF294a2d)),
      //               ),
      //               padding: EdgeInsets.all(16),
      //               child: Text(
      //                 messages[index].messageContent,
      //                 style: TextStyle(fontSize: 15, color: Color(0xffc9c9c9)),
      //               ),
      //             ),
      //           ),
      //         );
      //       },
      //     ),
      //     Align(
      //       alignment: Alignment.bottomLeft,
      //       child: Container(
      //         padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
      //         height: 60,
      //         width: double.infinity,
      //         color: const Color(0xFF182226),
      //         child: Row(
      //           children: <Widget>[
      //             const SizedBox(
      //               width: 15,
      //             ),
      //             const Expanded(
      //               child: TextField(
      //
      //                 decoration: InputDecoration(
      //                     hintText: "Write message...", hintStyle: TextStyle(color: Colors.white), border: InputBorder.none),
      //               ),
      //             ),
      //             const SizedBox(
      //               width: 15,
      //             ),
      //             FloatingActionButton(
      //               onPressed: () {},
      //               child: const Icon(
      //                 Icons.send,
      //                 color: const Color(0xFF182226),
      //                 size: 18,
      //               ),
      //               backgroundColor: const Color(0xffaacaa8),
      //               elevation: 0,
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
