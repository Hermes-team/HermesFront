import 'package:flutter/material.dart';
import 'package:front/models/storage/storage.dart';
import 'package:front/services/globals.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import 'chat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    socket = io.io('https://hermessengerr.herokuapp.com');
    socket?.on('auth denied', (reason) => Navigator.pushReplacementNamed(context, '/signIn'));
    Storage.getTokens().then((tokens) => socket?.emit("authenticate", tokens));
    Storage.getUniqid().then((value) => userUniqid = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff20464f),
      body: ChatPage(),
    );
  }
}