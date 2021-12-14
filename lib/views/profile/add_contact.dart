import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:front/services/globals.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({Key? key}) : super(key: key);

  @override
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _tagController = TextEditingController();

  addFriend() {
    String username = _nameController.text;
    int tag = int.parse(_tagController.text);
    log("Adding friend: " + username + " " + tag.toString());
    socket?.emit("add friend", {"nickname": username, "tag": tag});
    FocusScope.of(context).unfocus();
  }

  @override
  void initState() {
    socket!.on("add friend success", (data) {
      Fluttertoast.showToast(msg: "Sent friend request!", gravity: ToastGravity.SNACKBAR);
    });

    socket!.on("add friend fail", (data) {
      Fluttertoast.showToast(msg: "User not found. Sorry.", gravity: ToastGravity.SNACKBAR);
    });

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
          'Add Contact',
          style: TextStyle(fontSize: 22, color: Color(0xffEBEBEB), fontWeight: FontWeight.w900),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 30),
                Center(
                  child: Image.asset(
                    "assets/icons/user.png",
                    height: 120,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 30),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        style: const TextStyle(color: Color(0xFFc9c9c9)),
                        decoration: const InputDecoration(hintText: "Name"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _tagController,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(color: Color(0xFFc9c9c9)),
                        decoration: const InputDecoration(hintText: "Tag"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a tag';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      addFriend();
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10.0, top: 20.0),
                    padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFF789677),
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
      ),
    );
  }
}
