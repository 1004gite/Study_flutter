import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram Clone',
        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Padding(
      //모든 모서리에 패딩 적용
      padding: EdgeInsets.all(8.0),
      //아이폰을 위한 safearea 적용
      child: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Text('Instagram에 오신 것을 한영합니다',
                  style: TextStyle(fontSize: 24.0),
                ),
                //Text사이에 간격을 주기 위한 Padding
                Padding(padding: EdgeInsets.all(8.0)),
                Text('사진과 동영상을 보려면 팔로우하세요.'),
                Padding(padding: EdgeInsets.all(16.0)),
                //widget의 크기를 정하기 위한 SizedBox
                SizedBox(
                  width: 260.0,
                  child: Card(
                    //elevation 옵션으로 Card 위젯의 그림자 깊이를 설정
                    elevation: 6.0,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 80.0,
                          height: 80.0,
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(8.0)),
                        Text('xxx@xxx.com',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Kim Gitae'),
                        Padding(padding: EdgeInsets.all(8.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 70.0,
                              height: 70.0,
                              //사진 사용시 fit 옵션으로 비율을 정할 수 있음
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(1.0)),
                            SizedBox(
                              width: 70.0,
                              height: 70.0,
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(1.0)),
                            SizedBox(
                              width: 70.0,
                              height: 70.0,
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(4.0)),
                        Text('Facebook 친구'),
                        Padding(padding: EdgeInsets.all(4.0)),
                        RaisedButton(
                          onPressed: () {},
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                          child: Text('팔로우'),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
