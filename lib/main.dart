import 'package:flutter/material.dart';
import 'package:front/models/storage/storage.dart';
import 'package:front/views/home/home.dart';
import 'package:front/views/login/sign_in.dart';
import 'package:front/views/login/sign_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Widget startPage =
      await Storage.hasToken() ? const HomePage() : const SignInPage();
  runApp(MyApp(page: startPage));
}

class MyApp extends StatelessWidget {
  final Widget startPage;

  MyApp({Key? key, Widget? page})
      : startPage = page!,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hermes',
      theme: ThemeData(
          colorScheme: const ColorScheme(
              primary: Color(0xFF789677),
              primaryVariant: Color(0xFFFAFAFA),
              secondary: Color(0xFF8C8C8C),
              secondaryVariant: Color(0xFF585858),
              surface: Color(0xff213339),
              background: Color(0xFF29454E),
              error: Color(0xFFCD2828),
              onPrimary: Color(0xFFFAFAFA),
              onSecondary: Color(0xFFFAFAFA),
              onSurface: Color(0xFFFAFAFA),
              onBackground: Color(0xFFFAFAFA),
              onError: Color(0xFFFAFAFA),
              brightness: Brightness.dark),
          scaffoldBackgroundColor: const Color(0xFF29454E),
          fontFamily: 'Righteous',
          textTheme: const TextTheme(
            headline1: TextStyle(
                fontSize: 72.0,
                fontFamily: 'ZenKurenaido',
                color: Color(0xFF789677)),
            headline2: TextStyle(
                fontSize: 50.0,
                fontFamily: 'ZenKurenaido',
                color: Color(0xFF789677)),
            headline3: TextStyle(
                fontSize: 36.0,
                fontFamily: 'ZenKurenaido',
                color: Color(0xFF789677)),
            headline4: TextStyle(
                fontSize: 24.0,
                fontFamily: 'ZenKurenaido',
                color: Color(0xFF789677)),
            headline5: TextStyle(
                fontSize: 20.0,
                fontFamily: 'ZenKurenaido',
                color: Color(0xFF789677)),
            headline6: TextStyle(
                fontSize: 16.0,
                fontFamily: 'ZenKurenaido',
                color: Color(0xFF789677)),
            subtitle1: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Color(0xFF8C8C8C)),
            subtitle2: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: Color(0xFF8C8C8C)),
            bodyText1: TextStyle(fontSize: 16.0, color: Color(0xFF8C8C8C)),
            bodyText2: TextStyle(fontSize: 14.0, color: Color(0xFF8C8C8C)),
            button: TextStyle(fontSize: 14.0, color: Color(0xFFFAFAFA)),
            caption: TextStyle(
                fontSize: 14.0,
                fontStyle: FontStyle.italic,
                color: Color(0xFFFAFAFA)),
            overline: TextStyle(fontSize: 14.0, color: Color(0xFFFAFAFA)),
          )),
      debugShowCheckedModeBanner: false,
      home: startPage,
      routes: {
        '/signIn': (BuildContext context) => const SignInPage(),
        '/signUp': (BuildContext context) => const SignUpPage(),
        '/home': (BuildContext context) => const HomePage(),
      },
    );
  }
}
