import 'package:flutter/material.dart';
import 'package:front/views/private_chat.dart';

class NewMessagePage extends StatefulWidget {
  @override
  _NewMessagePageState createState() => _NewMessagePageState();
}

class _NewMessagePageState extends State<NewMessagePage> {
  List<Map<String, dynamic>> contacts = [
    {"name": "Liam", "img": "assets/imgs/p2.png"},
    {"name": "Olivia", "img": "assets/imgs/p3.png"},
    {"name": "Ava", "img": "assets/imgs/p6.png"},
    {"name": "Oscar", "img": "assets/imgs/p4.png"},
    {"name": "Ivy", "img": "assets/imgs/p1.png"},
    {"name": "Jack", "img": "assets/imgs/p5.png"},
    {"name": "Noah", "img": "assets/imgs/p2.png"},
    {"name": "Oliver", "img": "assets/imgs/p3.png"},
    {"name": "William", "img": "assets/imgs/p6.png"},
    {"name": "Sophia", "img": "assets/imgs/p4.png"},
    {"name": "Mary", "img": "assets/imgs/p1.png"},
    {"name": "Alexander", "img": "assets/imgs/p5.png"},
    {"name": "Lucas", "img": "assets/imgs/p2.png"}
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
          'New Message',
          style: TextStyle(fontSize: 22, color: Color(0xffEBEBEB), fontWeight: FontWeight.w900),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                    child: ListTile(
                      // onTap: () => navigatePage(
                      //   context,
                      //   PrivateChatPage(
                      //       name: contacts[index]["name"],
                      //       img: contacts[index]["img"]),
                      // ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return PrivateChatPage(name: contacts[index]["name"],img: contacts[index]["img"]);
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
