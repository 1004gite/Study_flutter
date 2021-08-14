import 'package:flutter/material.dart';
import 'package:flutter_base/instagram_clone/login_page.dart';
import 'instagram_clone/tab_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.white,
            accentColor: Colors.black
        ),
        home: LoginPage()
    );
  }
}
