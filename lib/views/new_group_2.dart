import 'package:flutter/material.dart';

import 'group_chat.dart';

class NewGroup2Page extends StatefulWidget {
  const NewGroup2Page({Key? key}) : super(key: key);

  @override
  _NewGroup2PageState createState() => _NewGroup2PageState();
}

class _NewGroup2PageState extends State<NewGroup2Page> {
  List<Map<String, dynamic>> contacts = [
    {"name": "Liam", "img": "assets/imgs/p2.png"},
    {"name": "Ava", "img": "assets/imgs/p6.png"},
    {"name": "Oscar", "img": "assets/imgs/p4.png"},
  ];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();

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
            Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20, right: 20, bottom: 10, left: 30),
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/icons/group.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        width: 210,
                        child: TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                              hintText: "Enter group name",
                              hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white))),
                          style: TextStyle(fontSize: 14, color: Colors.white),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a name';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 12.0),
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    decoration: const BoxDecoration(
                      color: Color(0xFF182226),
                    ),
                    height: 40,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "3 Members",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: contacts.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                          child: ListTile(
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
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return GroupChatPage(name: nameController.text, img: 'assets/icons/group.png');
                          }));
                        }
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
