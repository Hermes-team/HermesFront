import 'package:flutter/material.dart';
import 'package:front/views/new_group_2.dart';

class NewGroupPage extends StatefulWidget {
  @override
  _NewGroupPageState createState() => _NewGroupPageState();
}

class _NewGroupPageState extends State<NewGroupPage> {
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
          'New Group',
          style: TextStyle(fontSize: 22, color: Color(0xffEBEBEB), fontWeight: FontWeight.w900),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
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
                        return Contact(contact: contacts[index]);
                      }),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: kToolbarHeight,
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return NewGroup2Page();
                        }));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                        decoration: BoxDecoration(
                          color: Color(0xFF789677),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: const Text(
                          "Continue",
                          style: TextStyle(fontSize: 18, color: Color(0xFF182226)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Contact extends StatelessWidget {
  const Contact({
    required this.contact,
  }) : super();

  final Map<String, dynamic> contact;

  @override
  Widget build(BuildContext context) {
    var checked = false;

    return StatefulBuilder(builder: (context, setState) {
      return GestureDetector(
        onTap: () => setState(() {
          checked = !checked ? true : false;
        }),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
          child: ListTile(
            title: Text(
              "${contact["name"]}",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            contentPadding: EdgeInsets.all(4),
            leading: CircleAvatar(
              maxRadius: 32.0,
              child: Image.asset(
                "${contact["img"]}",
              ),
            ),
            trailing: Container(
              margin: EdgeInsets.only(right: 12.0),
              width: 30,
              height: 30,
              decoration: checked
                  ? const BoxDecoration(image: DecorationImage(fit: BoxFit.fitWidth, image: AssetImage('assets/icons/tick.png')))
                  : null,
            ),
          ),
        ),
      );
    });
  }
}
