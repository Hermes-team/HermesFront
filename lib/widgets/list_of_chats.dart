import 'package:flutter/material.dart';
import 'package:front/models/chat_users_model.dart';
import 'package:front/views/profile.dart';
import 'package:front/widgets/conversation_list.dart';

class ListOfChats extends StatefulWidget {
  @override
  _ListOfChatsState createState() => _ListOfChatsState();
}

class _ListOfChatsState extends State<ListOfChats> {
  List<ChatUsers> chatUsers = [
    ChatUsers(
        name: "Liam",
        messageText: "That's Great",
        imageURL:
        "assets/imgs/p1.png",
        time: "Yesterday"),
    ChatUsers(
        name: "Olivia",
        messageText: "bye",
        imageURL:
        "assets/imgs/p2.png",
        time: "31 Mar"),
    ChatUsers(
        name: "Ava",
        messageText: "Busy! Call me in 20 mins",
        imageURL:
        "assets/imgs/p3.png",
        time: "28 Mar"),
    ChatUsers(
        name: "Oscar",
        messageText: "Thankyou, It's awesome",
        imageURL:
        "assets/imgs/p4.png",
        time: "23 Mar"),
    ChatUsers(
        name: "Jack",
        messageText: "will update you in evening",
        imageURL:
        "assets/imgs/p5.png",
        time: "17 Mar"),
    ChatUsers(
        name: "Ivy",
        messageText: "Can you please share the file?",
        imageURL:
        "assets/imgs/p6.png",
        time: "24 Feb"),
    ChatUsers(
        name: "Emma",
        messageText: "How are you?",
        imageURL:
        "assets/imgs/p1.png",
        time: "18 Feb"),
    ChatUsers(
        name: "Charlotte",
        messageText: "will update you in evening",
        imageURL:
        "assets/imgs/p2.png",
        time: "17 Mar"),
    ChatUsers(
        name: "Noah",
        messageText: "Can you please share the file?",
        imageURL:
        "assets/imgs/p3.png",
        time: "24 Feb"),
    ChatUsers(
        name: "John",
        messageText: "How are you?",
        imageURL:
        "assets/imgs/p4.png",
        time: "18 Feb"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF223239),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF182226),
        title: Center(
          child: Container(
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
