import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:front/models/storage/storage.dart';
import 'package:front/services/globals.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:socket_io_client/socket_io_client.dart';

import 'list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    const address = 'https://hermesback.glitch.me/';
    socket = io.io(address,
        OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build()
    );

    socket!.connect();

    socket!.onConnect((_) {
      log("Connected to " + address);
      Storage.getTokens().then((tokens) {
        log("Sending authentication request.");
        socket!.emit("authenticate", tokens);
      });
    });

    socket!.onConnecting((data) {
      log(data.toString());
      log("Connecting to a websocket...");
    });

    socket!.onConnectError((data) {
      log(data.toString());
      log("Error connection!");
    });

    socket!.onDisconnect((data) {
      log(data.toString());
      log("Disconnected");
    });

    socket!.onReconnect((data) {
      log(data.toString());
      log("Reconnect");
    });

    socket!.onReconnecting((data) {
      log(data.toString());
      log("Reconnecting");
    });

    socket!.onReconnectError((data) {
      log(data.toString());
      log("Reconnect error");
    });

    socket!.onReconnectAttempt((data) {
      log(data.toString());
      log("Reconnect attempt");
    });

    socket!.onReconnectFailed((data) {
      log(data.toString());
      log("Reconnect failed");
    });

    socket!.on('auth denied', (reason) {
      log("Authentication failed. Rerouting.");
      Navigator.pushReplacementNamed(context, '/signIn');
    });

    Storage.getUniqid().then((value) {
      userUniqid = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff20464f),
      body: ListOfChats(),
    );
  }
}