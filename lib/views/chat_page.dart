import 'package:flutter/material.dart';
import 'package:front/models/chat_users_model.dart';
import 'package:front/models/storage/storage.dart';
import 'package:front/widgets/conversation_list.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers(name: "Jane Russel", messageText: "Awesome Setup", imageURL: "https://cdn-icons.flaticon.com/png/512/2202/premium/2202112.png?token=exp=1635935953~hmac=ac5a01442439a73ab4c915f5471e2b3a", time: "Now"),
    ChatUsers(name: "Glady's Murphy", messageText: "That's Great", imageURL: "https://cdn-icons.flaticon.com/png/512/2202/premium/2202112.png?token=exp=1635935953~hmac=ac5a01442439a73ab4c915f5471e2b3a", time: "Yesterday"),
    ChatUsers(name: "Jorge Henry", messageText: "Hey where are you?", imageURL: "https://cdn-icons.flaticon.com/png/512/2202/premium/2202112.png?token=exp=1635935953~hmac=ac5a01442439a73ab4c915f5471e2b3a", time: "31 Mar"),
    ChatUsers(name: "Philip Fox", messageText: "Busy! Call me in 20 mins", imageURL: "https://cdn-icons.flaticon.com/png/512/2202/premium/2202112.png?token=exp=1635935953~hmac=ac5a01442439a73ab4c915f5471e2b3a", time: "28 Mar"),
    ChatUsers(name: "Debra Hawkins", messageText: "Thankyou, It's awesome", imageURL: "https://cdn-icons.flaticon.com/png/512/2202/premium/2202112.png?token=exp=1635935953~hmac=ac5a01442439a73ab4c915f5471e2b3a", time: "23 Mar"),
    ChatUsers(name: "Jacob Pena", messageText: "will update you in evening", imageURL: "https://cdn-icons.flaticon.com/png/512/2202/premium/2202112.png?token=exp=1635935953~hmac=ac5a01442439a73ab4c915f5471e2b3a", time: "17 Mar"),
    ChatUsers(name: "Andrey Jones", messageText: "Can you please share the file?", imageURL: "https://cdn-icons.flaticon.com/png/512/2202/premium/2202112.png?token=exp=1635935953~hmac=ac5a01442439a73ab4c915f5471e2b3a", time: "24 Feb"),
    ChatUsers(name: "John Wick", messageText: "How are you?", imageURL: "https://cdn-icons.flaticon.com/png/512/2202/premium/2202112.png?token=exp=1635935953~hmac=ac5a01442439a73ab4c915f5471e2b3a", time: "18 Feb"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff20464f),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(

              child: Padding(

                padding: const EdgeInsets.only(left: 20,right: 16,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text("Your Chats",style: TextStyle(fontSize: 25 ,fontWeight: FontWeight.bold, color: Color(0xff709775)), ),
                    Container(
                      padding: const EdgeInsets.only(left: 8,right: 8,top: 1,bottom: 1),
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xff709775),
                      ),
                      child: Row(
                        children: <Widget>[
                          const Icon(Icons.add,color: Color(0xff1b343A),size: 30,),
                          const SizedBox(width: 10),
                          IconButton(
                            icon: const Icon(
                            Icons.logout_sharp,
                              color: Color(0xff1b343A),
                              size: 30,
                            ),
                            onPressed: () {
                              Storage.removeTokens();
                              Navigator.pushReplacementNamed(context, '/signIn');
                            },
                          )
                          //Text("Add New",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 0,left: 16,right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: const TextStyle(color: Color(0xff709775)),
                  prefixIcon: const Icon(Icons.search,color: Color(0xff709775), size: 20,),
                  filled: true,
                  fillColor: const Color(0xff1b343A),
                  contentPadding: const EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                          color: Color(0xff1b343A)
                      )
                  ),
                ),
              ),
            ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 0,left: 16,right: 16),
                child: ListView.builder(
                  itemCount: chatUsers.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 10),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index){
                    return ConversationList(
                      name: chatUsers[index].name,
                      messageText: chatUsers[index].messageText,
                      imageUrl: chatUsers[index].imageURL,
                      time: chatUsers[index].time,
                      isMessageRead: (index == 0 || index == 3)?true:false,
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



