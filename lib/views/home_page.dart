import 'package:flutter/material.dart';

import 'chat_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff20464f),
      body: ChatPage(),
    );
  }
}
