import 'package:flutter/material.dart';
import 'package:front/views/sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hermes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignInForm(),
    );
  }
}
