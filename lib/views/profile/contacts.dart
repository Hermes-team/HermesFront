import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:front/models/res/friend_res.dart';
import 'package:front/models/res/friends_res.dart';
import 'package:front/services/globals.dart';
import 'package:front/views/chat/private_chat.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<ContactsPage> {
  List<Map<String, dynamic>> contacts = [];

  @override
  void initState() {
    socket?.on("get friends success", (friends) {
      log("Friends success");
      log(friends.toString());
      var parsedFriends = Friends.fromJson(friends);
      if (parsedFriends.friends != null) {
        for (var f in parsedFriends.friends!) {
          var parsedFriend = Friend.fromJson(f);
          contacts.add(
              {"name": parsedFriend.nickname, "img": "assets/imgs/p2.png"});
        }
      }
      if (mounted) {
        setState(() {});
      }
    });

    socket?.on("get friends fail", (data) {
      log("Friends fail");
    });
    
    socket?.emit("get friends");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF223239),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF182226),
        // toolbarHeight: 65,
        iconTheme: const IconThemeData(
          color: Colors.grey,
        ),
        title: const Text(
          'Contacts',
          style: TextStyle(fontSize: 22, color: Color(0xffEBEBEB), fontWeight: FontWeight.w900),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: const TextField(
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
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return PrivateChatPage(name: contacts[index]["name"],img: contacts[index]["img"]);
                        }));
                      },
                      title: Text(
                        "${contacts[index]["name"]}",
                        style: const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      contentPadding: const EdgeInsets.all(4),
                      leading: CircleAvatar(
                        maxRadius: 32.0,
                        child: Image.asset(
                          "${contacts[index]["img"]}",
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
