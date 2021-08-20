import 'package:flutter/material.dart';
import 'package:flutter_base/instagram_clone/login_page.dart';
import 'instagram_clone/tab_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // StreamBuilder를 통해 비동기적으로 로그인 여부를 처리
    return StreamBuilder<FirebaseUser>(
      //변화를 주는 주체를 firebase인증서로 설정함
      stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if( snapshot.hasData){
            return TabPage(snapshot.data);
          }
          else{
            return LoginPage();
          }
        }
    );
  }
}
