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
        name: "Jane Russel",
        messageText: "Awesome Setup",
        imageURL:
            "https://cdn-icons.flaticon.com/png/512/2202/premium/2202112.png?token=exp=1635935953~hmac=ac5a01442439a73ab4c915f5471e2b3a",
        time: "Now"),
    ChatUsers(
        name: "Liam",
        messageText: "That's Great",
        imageURL:
            "https://cdn-icons.flaticon.com/png/512/2202/premium/2202112.png?token=exp=1635935953~hmac=ac5a01442439a73ab4c915f5471e2b3a",
        time: "Yesterday"),
    ChatUsers(
        name: "Olivia",
        messageText: "Hey where are you?",
        imageURL:
            "https://cdn-icons.flaticon.com/png/512/2202/premium/2202112.png?token=exp=1635935953~hmac=ac5a01442439a73ab4c915f5471e2b3a",
        time: "31 Mar"),
    ChatUsers(
        name: "Ava",
        messageText: "Busy! Call me in 20 mins",
        imageURL:
            "https://cdn-icons.flaticon.com/png/512/2202/premium/2202112.png?token=exp=1635935953~hmac=ac5a01442439a73ab4c915f5471e2b3a",
        time: "28 Mar"),
    ChatUsers(
        name: "Oscar",
        messageText: "Thankyou, It's awesome",
        imageURL:
            "https://cdn-icons.flaticon.com/png/512/2202/premium/2202112.png?token=exp=1635935953~hmac=ac5a01442439a73ab4c915f5471e2b3a",
        time: "23 Mar"),
    ChatUsers(
        name: "Ivy",
        messageText: "will update you in evening",
        imageURL:
            "https://cdn-icons.flaticon.com/png/512/2202/premium/2202112.png?token=exp=1635935953~hmac=ac5a01442439a73ab4c915f5471e2b3a",
        time: "17 Mar"),
    ChatUsers(
        name: "Jack",
        messageText: "Can you please share the file?",
        imageURL:
            "https://cdn-icons.flaticon.com/png/512/2202/premium/2202112.png?token=exp=1635935953~hmac=ac5a01442439a73ab4c915f5471e2b3a",
        time: "24 Feb"),
    ChatUsers(
        name: "Emma",
        messageText: "How are you?",
        imageURL:
            "https://cdn-icons.flaticon.com/png/512/2202/premium/2202112.png?token=exp=1635935953~hmac=ac5a01442439a73ab4c915f5471e2b3a",
        time: "18 Feb"),
    ChatUsers(
        name: "Charlotte",
        messageText: "will update you in evening",
        imageURL:
            "https://cdn-icons.flaticon.com/png/512/2202/premium/2202112.png?token=exp=1635935953~hmac=ac5a01442439a73ab4c915f5471e2b3a",
        time: "17 Mar"),
    ChatUsers(
        name: "Noah",
        messageText: "Can you please share the file?",
        imageURL:
            "https://cdn-icons.flaticon.com/png/512/2202/premium/2202112.png?token=exp=1635935953~hmac=ac5a01442439a73ab4c915f5471e2b3a",
        time: "24 Feb"),
    ChatUsers(
        name: "Oliver",
        messageText: "How are you?",
        imageURL:
            "https://cdn-icons.flaticon.com/png/512/2202/premium/2202112.png?token=exp=1635935953~hmac=ac5a01442439a73ab4c915f5471e2b3a",
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
                    style: TextStyle(color: Colors.white),
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
