import 'package:flutter/material.dart';
import 'package:front/views/private_chat.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<ContactsPage> {
  List<Map<String, dynamic>> contacts = [
    {"name": "Liam", "img": "assets/imgs/p2.png"},
    {"name": "Olivia", "img": "assets/imgs/p3.png"},
    {"name": "Ava", "img": "assets/imgs/p6.png"},
    {"name": "Oscar", "img": "assets/imgs/p4.png"},
    {"name": "Ivy", "img": "assets/imgs/p1.png"},
    {"name": "Jack", "img": "assets/imgs/p5.png"},
    {"name": "Liam", "img": "assets/imgs/p2.png"},
    {"name": "Olivia", "img": "assets/imgs/p3.png"},
    {"name": "Ava", "img": "assets/imgs/p6.png"},
    {"name": "Oscar", "img": "assets/imgs/p4.png"},
    {"name": "Ivy", "img": "assets/imgs/p1.png"},
    {"name": "Jack", "img": "assets/imgs/p5.png"},
    {"name": "Liam", "img": "assets/imgs/p2.png"}
  ];

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
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Color(0xff8D8D8D)),
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
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return PrivateChatPage();
                        }));
                      },
                      title: Text(
                        "${contacts[index]["name"]}",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      contentPadding: EdgeInsets.all(4),
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
