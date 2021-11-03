import 'package:flutter/material.dart';
import 'package:front/views/home_page.dart';


class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  //TODO: Request server and check if successful
  void signUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  void goToSignIn() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ListView(
          children: [
            Text('Hermes', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline2),
            Text('Fast. Reliable. Secure.', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline5),
            const Padding(padding: EdgeInsets.all(40.0)),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email address',
                contentPadding: EdgeInsets.all(5.0),
              ),
            ),
            const Padding(padding: EdgeInsets.all(5.0)),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Nickname',
                contentPadding: EdgeInsets.all(5.0),
              ),
            ),
            const Padding(padding: EdgeInsets.all(5.0)),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                contentPadding: EdgeInsets.all(5.0),
              ),
            ),
            const Padding(padding: EdgeInsets.all(20.0)),
            ElevatedButton(
              onPressed: () => signUp(),
              child: const Text('Sign Up'),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ))
              ),
            ),
            Row(
                children: [
                  const Text('Already an user?'),
                  TextButton(
                    onPressed: goToSignIn,
                    child: const Text('Sign in!'),
                  )
                ]
            )
          ],
        ),
      ),
    );
  }
}