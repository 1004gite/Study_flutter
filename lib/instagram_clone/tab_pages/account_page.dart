import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AccountPage extends StatefulWidget {
  final FirebaseUser user;
  AccountPage(this.user);
  // const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final GoogleSignIn _googlesignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  _buildAppbar() {
    return AppBar(
      actions: [
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            FirebaseAuth.instance.signOut();
            _googlesignIn.signOut();
          },
        )
      ],
    );
  }

  _buildBody() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            //Row의 childern간의 간격을 위한 옵션
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  //겹쳐있는 위젯을 만들기 위한 Stack
                  Stack(
                    children: [
                      SizedBox(
                        width: 80.0,
                        height: 80.0,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(widget.user.photoUrl),
                        ),
                      ),
                      //floatingButton의 크기를 정하기 위해 작은 SizedBox를 만들어 그 안에 버튼을 넣었다.
                      //커튼의 위치를 설정하기 위해 사진만한 크기의 Container를 Stack에 만들어 위치를 정하게끔함.
                      Container(
                        width: 80.0,
                        height: 80.0,
                        alignment: Alignment.bottomRight,
                        //버튼 뒤에 조금 더 큰 원을 넣어서 희 테두리를 만들기 위해 Stack을 한번 더 사용
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 28.0,
                              height: 28.0,
                              child: FloatingActionButton(
                                onPressed: () {  },
                                backgroundColor: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 25.0,
                              height: 25.0,
                              child: FloatingActionButton(
                                onPressed: () {  },
                                backgroundColor: Colors.blue,
                                child: Icon(Icons.add),
                              ),
                            ),
                          ],
                        )
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  Text(widget.user.displayName,
                    //텍스트를 가운데정렬
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text('0\n게시물',
                //텍스트를 가운데정렬
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text('0\n팔로워',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text('0\n팔로잉',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
