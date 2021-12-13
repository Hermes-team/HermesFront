import 'package:flutter/material.dart';

class InviteFriendPage extends StatefulWidget {
  const InviteFriendPage({Key? key}) : super(key: key);

  @override
  _InviteFriendState createState() => _InviteFriendState();
}

class _InviteFriendState extends State<InviteFriendPage> {
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
          'Invite Friend',
          style: TextStyle(fontSize: 22, color: Color(0xffEBEBEB), fontWeight: FontWeight.w900),
        ),
      ),
      body: SafeArea(
        child: Column(),
      ),
    );
  }
}
