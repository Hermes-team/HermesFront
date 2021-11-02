import 'package:flutter/material.dart';


class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final loginCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    loginCtrl.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    print('Second text field: ${loginCtrl.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retrieve Text Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            const Image(image: AssetImage('lib/imgs/wings.png')),
            const Text('Hermes'),
            TextField(
              controller: loginCtrl,

            ),
            TextField(
              controller: passwordCtrl,
            ),
            ElevatedButton(
                onPressed: () => _printLatestValue(),
                child: const Text('Sign In')
            ),
            Row(
              children: [
                const Text('Or'),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: () { },
                  child: const Text('create an account'),
                )
              ]
            )
          ],
        ),
      ),
    );
  }
}