import 'package:flutter/material.dart';


class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {

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
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ListView(
          children: [
            const Image(image: AssetImage('imgs/hermes.png'), height: 200),
            Text('Hermes', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline2),
            Text('Fast. Reliable. Secure.', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline5),
            const Padding(padding: EdgeInsets.all(20.0)),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email address',
                contentPadding: EdgeInsets.all(5.0),
              ),
            ),
            const Padding(padding: EdgeInsets.all(7.0)),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                contentPadding: EdgeInsets.all(5.0),
              ),
            ),
            const Padding(padding: EdgeInsets.all(20.0)),
            ElevatedButton(
                onPressed: () => _printLatestValue(),
                child: const Text('Sign In'),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ))
                ),
            ),
            Row(
              children: [
                const Text('Or'),
                TextButton(
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