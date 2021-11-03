import 'package:flutter/material.dart';

import 'chat_page.dart';


class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff20464f),
      body: ChatPage(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xffa1cca5),
        unselectedItemColor: const Color(0xff709775),
        backgroundColor: const Color(0xff1b343A),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_rounded),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_add_outlined),
            label: 'Groups',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.keyboard_control_rounded),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
