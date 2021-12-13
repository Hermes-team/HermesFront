import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:front/models/chat_users_model.dart';
import 'package:front/models/res/server_res.dart';
import 'package:front/services/globals.dart';
import 'package:front/views/profile.dart';
import 'package:front/widgets/conversation_list.dart';

class ListOfChats extends StatefulWidget {
  const ListOfChats({Key? key}) : super(key: key);

  @override
  _ListOfChatsState createState() => _ListOfChatsState();
}

class _ListOfChatsState extends State<ListOfChats> {
  List<ChatUsers> chatUsers = [];

  @override
  void initState() {
    socket!.on('servers', (servers) {
      if (servers == null) {
        log("No servers found!");
        return;
      }

      for (var server in servers) {
        var parsedServer = ServerRes.fromJson(server);
        chatUsers.add(ChatUsers(name: parsedServer.name!, messageText: parsedServer.lastMessage!, imageURL: "", time: ""));
      }
      setState(() {});
    });

    socket!.on('authenticated', (_) {
      log("Authenticated. Retrieving server list");
      socket?.emit('get servers');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF223239),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF182226),
        title: Center(
          child: Row(
            children: <Widget>[
              const Expanded(
                child: TextField(
                  style: TextStyle(color: Color(0xFFc9c9c9)),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search...",
                    hintStyle: TextStyle(color: Color(0xFFc9c9c9)),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xff8D8D8D),
                      size: 28,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProfilePage();
                  }));
                },
                icon: const Icon(
                  Icons.settings,
                  color: Color(0xff8D8D8D),
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
                      img: chatUsers[index].imageURL,
                      time: chatUsers[index].time,
                      isMessageRead: (index == 0 || index == 3),
                      isGroup: chatUsers[index].name == 'Group',
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
