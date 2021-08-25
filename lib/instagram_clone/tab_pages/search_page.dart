import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_base/instagram_clone/tab_pages/sub_pages/create_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_base/instagram_clone/tab_pages/sub_pages/post_page.dart';

class SearchPage extends StatefulWidget {
  // const SearchPage({Key? key}) : super(key: key);
  final FirebaseUser user;
  SearchPage(this.user);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  // List<File> gridItems = [];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePage(widget.user)));
        },
        child: Icon(Icons.create),
      ),
      appBar: AppBar(),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return StreamBuilder(
      //Firestore안 post폴더 하위의 파일들이 변경 시 적용을 의미함
      stream: Firestore.instance.collection('post').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if(!snapshot.hasData){
          //snapshot에 데이터가 없는 경우 로딩표시
          return Center(child: CircularProgressIndicator());
        }
        //데이터가 없는 경우(문서가 빈 경우) items를 빈 리스트로 설정
        var items = snapshot.data!.documents ?? [];

        return GridView.builder(
          //그리드뷰의 옵션들
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
            ),
            itemCount: items.length,//gridItems.length,
            //그리드뷰의 어댑터 역할
            itemBuilder: (buildContext, index) {
              return _buildListItem(buildContext,items[index]);
            }
        );
      },
    );
  }

  _buildListItem(buildContext, document) {
    // return Image.file(gridItems[index]);
    //InkWell은 클릭시 물방울 퍼지는 효과를 주고 onTap기능 지정가능
    return Hero(
      //클릭시 화면전환 애니매이션을 위한 Hero위젯 사용
      tag: document['photoUrl'],
      child: Material(
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return PostPage(document);
            }));
          },
          child: Image.network(
            document['photoUrl'],
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
