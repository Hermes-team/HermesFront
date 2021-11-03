import 'dart:io';
import 'package:flutter/material.dart';
import 'package:front/models/register_model.dart';
import 'package:front/services/auth_service.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final controllers = { 'emailCtrl': TextEditingController(), 'nicknameCtrl': TextEditingController(), 'passwordCtrl': TextEditingController() };
  final _formKey = GlobalKey<FormState>();

  RegisterModel getFormData() {
    return RegisterModel(email: controllers['emailCtrl']!.text, nickname: controllers['nicknameCtrl']!.text, password: controllers['passwordCtrl']!.text);
  }

  //TODO: Check if success
  Future<void> signUp() async {
    if (!_formKey.currentState!.validate()) return;
    try {
      var res = await AuthService.register(getFormData());
      print(res);
    } catch (error) {
      switch (error) {
        SocketException:
          //TODO: display Server Is Down note or something
        default:
          rethrow;
      }
    }

    Navigator.pushReplacementNamed(context, '/');
  }

  void goToSignIn() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    controllers.forEach((_, value) { value.dispose(); });
    super.dispose();
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
            Form(key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: controllers['emailCtrl'],
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
                  controller: controllers['nicknameCtrl'],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter nickname';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Nickname',
                    contentPadding: EdgeInsets.all(5.0),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(5.0)),
                TextFormField(
                  controller: controllers['passwordCtrl'],
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
                  onPressed: () => signUp(),
                  child: const Text('Sign Up'),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ))
                  ),
                ),
              ],
            )),
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