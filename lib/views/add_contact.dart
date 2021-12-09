import 'package:flutter/material.dart';
import 'package:front/views/private_chat.dart';

class AddContactPage extends StatefulWidget {
  @override
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
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
          'Add Contact',
          style: TextStyle(fontSize: 22, color: Color(0xffEBEBEB), fontWeight: FontWeight.w900),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              Center(
                child: Image.asset(
                  "assets/icons/user.png",
                  height: 120,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 30),
                child: Column(
                  children: const [
                    TextField(style: TextStyle(color: Color(0xFFc9c9c9)), decoration: InputDecoration(hintText: "Name")),
                    SizedBox(height: 10),
                    TextField(style: TextStyle(color: Color(0xFFc9c9c9)), decoration: InputDecoration(hintText: "Tag")),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PrivateChatPage();
                  }));
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10.0, top: 20.0),
                  padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF789677),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(fontSize: 19, color: Color(0xFF182226)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
