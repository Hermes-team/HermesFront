import 'package:flutter/material.dart';
import 'package:front/models/chat_users_model.dart';
import 'package:front/models/res/server_res.dart';
import 'package:front/widgets/conversation_list.dart';
import 'package:front/services/globals.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUsers = [];
  
  @override
  void initState() {
    print("test" + (socket != null).toString());
    socket?.on('servers', (servers) {
      print(servers.toString());
      if (servers == null) return;

      for (var server in servers) {
        var parsedServer = ServerRes.fromJson(server);
        chatUsers.add(ChatUsers(name: parsedServer.name!, messageText: parsedServer.lastMessage!, imageURL: "", time: ""));
      }
      setState(() {});
    });
    socket?.on('authenticated', (_) => socket?.emit('get servers'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF223239),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff213339),
        title: Center(
          child: Container(
            padding: const EdgeInsets.only(right: 5),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search...",
                      hintStyle: const TextStyle(color: Color(0xff8D8D8D)),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color(0xff000000),
                        size: 20,
                      ),
                      filled: true,
                      fillColor: Colors.white12,
                      contentPadding: const EdgeInsets.all(2),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(color: Color(0xff1b343A))),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    //Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.settings,
                    color: Color(0xff8D8D8D),
                  ),
                ),
                // const Spacer(
                // ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // SafeArea(
            //   child: Padding(
            //     padding: const EdgeInsets.only(top: 15, left: 16, right: 70),
            //     child: TextField(
            //       decoration: InputDecoration(
            //         hintText: "Search...",
            //         hintStyle: const TextStyle(color: Color(0xff8D8D8D)),
            //         prefixIcon: const Icon(
            //           Icons.search,
            //           color: Color(0xff000000),
            //           size: 20,
            //         ),
            //         filled: true,
            //         //fillColor: const Color(0xff1b343A),
            //         contentPadding: const EdgeInsets.all(8),
            //         enabledBorder: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(20),
            //             borderSide: const BorderSide(color: Color(0xff1b343A))),
            //       ),
            //     ),
            //   ),
            // ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 0, left: 10, right: 10),
                child: ListView.builder(
                  itemCount: chatUsers.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 0),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ConversationList(
                      name: chatUsers[index].name,
                      messageText: chatUsers[index].messageText,
                      imageUrl: chatUsers[index].imageURL,
                      time: chatUsers[index].time,
                      isMessageRead: (index == 0 || index == 3) ? true : false,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
