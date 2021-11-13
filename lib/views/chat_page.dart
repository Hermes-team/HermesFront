import 'package:flutter/material.dart';
import 'package:front/models/chat_users_model.dart';
import 'package:front/widgets/conversation_list.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers(
        name: "Jane Russel",
        messageText: "Awesome Setup",
        imageURL:
            "https://cdn-icons.flaticon.com/png/512/2202/premium/2202112.png?token=exp=1635935953~hmac=ac5a01442439a73ab4c915f5471e2b3a",
        time: "Now"),
    ChatUsers(
        name: "Glady's Murphy",
        messageText: "That's Great",
        imageURL:
            "https://cdn-icons.flaticon.com/png/512/2202/premium/2202112.png?token=exp=1635935953~hmac=ac5a01442439a73ab4c915f5471e2b3a",
        time: "Yesterday"),
    ChatUsers(
        name: "Jorge Henry",
        messageText: "Hey where are you?",
        imageURL:
            "https://cdn-icons.flaticon.com/png/512/2202/premium/2202112.png?token=exp=1635935953~hmac=ac5a01442439a73ab4c915f5471e2b3a",
        time: "31 Mar"),
    ChatUsers(
        name: "Philip Fox",
        messageText: "Busy! Call me in 20 mins",
        imageURL:
            "https://cdn-icons.flaticon.com/png/512/2202/premium/2202112.png?token=exp=1635935953~hmac=ac5a01442439a73ab4c915f5471e2b3a",
        time: "28 Mar"),
    ChatUsers(
        name: "Debra Hawkins",
        messageText: "Thankyou, It's awesome",
        imageURL:
            "https://cdn-icons.flaticon.com/png/512/2202/premium/2202112.png?token=exp=1635935953~hmac=ac5a01442439a73ab4c915f5471e2b3a",
        time: "23 Mar"),
    ChatUsers(
        name: "Jacob Pena",
        messageText: "will update you in evening",
        imageURL:
            "https://cdn-icons.flaticon.com/png/512/2202/premium/2202112.png?token=exp=1635935953~hmac=ac5a01442439a73ab4c915f5471e2b3a",
        time: "17 Mar"),
    ChatUsers(
        name: "Andrey Jones",
        messageText: "Can you please share the file?",
        imageURL:
            "https://cdn-icons.flaticon.com/png/512/2202/premium/2202112.png?token=exp=1635935953~hmac=ac5a01442439a73ab4c915f5471e2b3a",
        time: "24 Feb"),
    ChatUsers(
        name: "John Wick",
        messageText: "How are you?",
        imageURL:
            "https://cdn-icons.flaticon.com/png/512/2202/premium/2202112.png?token=exp=1635935953~hmac=ac5a01442439a73ab4c915f5471e2b3a",
        time: "18 Feb"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF223239),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 16, right: 70),
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
                    //fillColor: const Color(0xff1b343A),
                    contentPadding: const EdgeInsets.all(8),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Color(0xff1b343A))),
                  ),
                ),
              ),
            ),
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
