import 'package:flutter/material.dart';
import 'package:front/models/login_model.dart';
import 'package:front/services/auth_service.dart';
import 'package:front/views/sign_up.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final controllers = { 'emailCtrl': TextEditingController(), 'passwordCtrl': TextEditingController() };
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;

  LoginModel getFormData() {
    return LoginModel(email: controllers['emailCtrl']!.text, password: controllers['passwordCtrl']!.text);
  }

  void login() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      var res = await AuthService.login(getFormData());
      print(res);
    } catch (error) {
      switch (error) {
        SocketException:
        //TODO: display Server Is Down note or something
        default:
          print(error);
          return;
      }
    }
    //TODO: change to '/'
    Navigator.pushReplacementNamed(context, '/home');
  }

  void goToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpPage()),
    );
  }

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
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
                    controller: controllers['emailCtrl'],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      }
                      return null;
                    },
                    enableSuggestions: true,
                    autocorrect: true,
                    decoration: const InputDecoration(
                      labelText: 'Email address',
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