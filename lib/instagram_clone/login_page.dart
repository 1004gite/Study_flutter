import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginPage extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Instagram Clone',
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
              Padding(padding: EdgeInsets.all(30.0)),
              SignInButton(
                Buttons.GoogleDark,
                onPressed: () {
                  //로그인 페이지 위젯은 비동기로 넘길 수 없으므로 내부에 await 타입을 사용할 수 없다
                  // .then을 이용하여 비동기를 처리한다.
                  _handleSignIn().then((user) {
                    print(user);
                  });
                },
              )
              ,
            ],
          ),
      ),
    );
  }

  //비동기를 이용하여 로그인
  Future<FirebaseUser> _handleSignIn() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    FirebaseUser user = await _auth.signInWithCredential(
      GoogleAuthProvider.getCredential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken)
    );
    return user;
  }

}
