import 'package:flutter/material.dart';


class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  // final loginCtrl = TextEditingController();
  // final passwordCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _printLatestValue() {
    print('Second text field:');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Hermes'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ListView(
          children: [
            const Image(image: AssetImage('imgs/hermes.png'), height: 200),
            const Text('Hermes', textAlign: TextAlign.center, style: TextStyle(fontSize: 50, fontFamily: 'ZenKurenaido')),
            const Text('Fast. Reliable. Secure.', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontFamily: 'ZenKurenaido')),
            const Padding(padding: EdgeInsets.all(20.0)),
            TextFormField(
              // controller: loginCtrl,
              decoration: const InputDecoration(
                labelText: 'Email address',
                contentPadding: EdgeInsets.all(5.0)
              ),
            ),
            TextFormField(
              // controller: passwordCtrl,
              decoration: const InputDecoration(
                labelText: 'Password',
                contentPadding: EdgeInsets.all(5.0)
              ),
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