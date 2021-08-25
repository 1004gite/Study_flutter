import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  //게시물 클릭시 나오는 화면
  // const PostPage({Key? key}) : super(key: key);
  final document;
  PostPage(this.document);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('둘러보기'),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(document['userPhotoUrl']),
                  ),
                  //왼쪽에만 padding을 넣기 위함
                  Padding(padding: EdgeInsets.only(left: 8.0)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(document['email'], style: TextStyle(fontWeight: FontWeight.bold),),
                      Text(document['displayName'])
                    ],
                  ),
                ],
              ),
            ),
            Hero(
              //뒤로가기시 searchPage에서 넘어오는 tag와 같은 위젯에 들어가는 효과를 줌
              tag: document['photoUrl'],
                child: Image.network(document['photoUrl'])
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
                child: Text(document['contents'])
            )
          ],
        ),
      ),
    );
  }
}
