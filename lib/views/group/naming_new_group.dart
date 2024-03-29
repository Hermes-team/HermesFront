import 'package:flutter/material.dart';
import 'package:front/models/chat_users_model.dart';

import '../chat/group_chat.dart';

class NamingNewGroup extends StatefulWidget {
  final List<ChatUsers> users;
  const NamingNewGroup({Key? key, required this.users}) : super(key: key);

  @override
  _NamingNewGroupState createState() => _NamingNewGroupState();
}

class _NamingNewGroupState extends State<NamingNewGroup> {
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
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20, right: 20, bottom: 10, left: 30),
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/icons/group.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 210,
                        child: TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                              hintText: "Enter group name",
                              hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white))),
                          style: const TextStyle(fontSize: 14, color: Colors.white),
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
                    margin: const EdgeInsets.symmetric(vertical: 12.0),
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
                      itemCount: widget.users.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                          child: ListTile(
                            title: Text(
                              widget.users[index].name,
                              style: const TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            contentPadding: const EdgeInsets.all(4),
                            leading: CircleAvatar(
                              maxRadius: 32.0,
                              child: Image.asset(
                                widget.users[index].imageURL,
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
                          color: const Color(0xFF789677),
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
