import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  List<Friend> contacts = [];
  List<Friend> pendingContacts = [];
  Random r = Random(1);

  void addPendingRequest(int index) {
    Friend toAccept = pendingContacts[index];
    dev.log("Accepting friend of: " + toAccept.nickname.toString() + " of uniq " + toAccept.uniqid.toString());
    socket!.emit("accept friend", {"uniqid": toAccept.uniqid });
  }

  @override
  void initState() {
    socket?.on("get friends success", (friends) {
      contacts.clear();
      pendingContacts.clear();
      dev.log("Friends success");
      dev.log(friends.toString());
      var parsedFriends = Friends.fromJson(friends);

      for (var f in parsedFriends.friends!) {
        var parsedFriend = Friend.fromJson(f);
        parsedFriend.img = "assets/imgs/p" + (r.nextInt(5) + 1).toString() + ".png";
        contacts.add(parsedFriend);
      }

      for (var f in parsedFriends.pendingRequests!) {
        var parsedFriend = Friend.fromJson(f);
        parsedFriend.img = "assets/imgs/p" + (r.nextInt(5) + 1).toString() + ".png";
        pendingContacts.add(parsedFriend);
      }

      if (mounted) {
        setState(() {});
      }
    });

    socket?.on("accept friend success", (data) {
      var note = "Successfully added friend";
      dev.log(note);
      Fluttertoast.showToast(msg: note, gravity: ToastGravity.SNACKBAR);
      socket?.emit("get friends");
    });

    socket?.on("get friends fail", (data) {
      dev.log("Friends fail");
      Fluttertoast.showToast(msg: "Could not retrieve contacts. Try again later.", gravity: ToastGravity.SNACKBAR);
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
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: pendingContacts.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                  child: Row(
                    children: [
                      Expanded(
                          child: ListTile(
                        onTap: null,
                        title: Text(
                          pendingContacts[index].nickname,
                          style: const TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        contentPadding: const EdgeInsets.all(4),
                        leading: CircleAvatar(
                          maxRadius: 32.0,
                          child: Image.asset(
                            pendingContacts[index].img!,
                          ),
                        ),
                      )),
                      Expanded(
                          child: TextButton(
                            onPressed: () { addPendingRequest(index); },
                            child: const Image(
                              image: AssetImage("assets/icons/add-user.png"),
                              height: 28,
                            ),
                          )
                      ),
                    ],
                  ),
                );
              },
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
                          return PrivateChatPage(name: contacts[index].nickname,img: contacts[index].img!, serversUniqid: contacts[index].uniqid,);
                        }));
                      },
                      title: Text(
                        contacts[index].nickname,
                        style: const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      contentPadding: const EdgeInsets.all(4),
                      leading: CircleAvatar(
                        maxRadius: 32.0,
                        child: Image.asset(
                          contacts[index].img!,
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
