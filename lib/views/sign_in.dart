import 'package:flutter/material.dart';
import 'package:front/views/sign_up.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  //TODO: Request server and check if successful
  void login() {
    if (!_formKey.currentState!.validate()) return;
    Navigator.pushReplacementNamed(context, '/');
  }

  void goToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpPage()),
    );
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
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Email address',
                      contentPadding: EdgeInsets.all(5.0),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(5.0)),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      contentPadding: EdgeInsets.all(5.0),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(20.0)),
                  ElevatedButton(
                    onPressed: () => login(),
                    child: const Text('Sign In'),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                            ))
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                const Text('Or'),
                TextButton(
                  onPressed: goToSignUp,
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