import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:front/models/req/register_req.dart';
import 'package:front/models/res/register_res.dart';
import 'package:front/models/storage/storage.dart';
import 'package:front/services/auth_service.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _controllers = { 'emailCtrl': TextEditingController(), 'nicknameCtrl': TextEditingController(), 'passwordCtrl': TextEditingController() };
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;

  RegisterReq getFormData() {
    return RegisterReq(email: _controllers['emailCtrl']!.text, nickname: _controllers['nicknameCtrl']!.text, password: _controllers['passwordCtrl']!.text);
  }

  Future<void> signUp() async {
    if (!_formKey.currentState!.validate()) return;
    try {
      var res = await AuthService.register(getFormData());
      final parsed = RegisterRes.fromJson(jsonDecode(res));
      if (parsed.success) {
        await Storage.createUser(parsed);
        Navigator.pushReplacementNamed(context, '/home');
        return;
      }
      Fluttertoast.showToast(msg: parsed.msg!, gravity: ToastGravity.SNACKBAR);
    } catch (error) {
      Fluttertoast.showToast(msg: 'Server is down. Try again later.', gravity: ToastGravity.TOP);
    }
  }

  void goToSignIn() {
    Navigator.pop(context);
  }

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  void dispose() {
    _controllers.forEach((_, value) { value.dispose(); });
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
                  controller: _controllers['emailCtrl'],
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
                  controller: _controllers['nicknameCtrl'],
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
                  controller: _controllers['passwordCtrl'],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                  obscureText: !_passwordVisible,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    contentPadding: const EdgeInsets.all(5.0),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
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