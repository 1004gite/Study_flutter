import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_base/instagram_clone/tab_pages/create_pages/create_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      body: _buildBody(),
    );
  }

  _buildBody() {
    return GridView.builder(
      //그리드뷰의 옵션들
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
        ),
        itemCount: 5,//gridItems.length,
        //그리드뷰의 어댑터 역할
        itemBuilder: (buildContext, index) {
          return _buildListItem(buildContext,index);
        }
    );
  }

  _buildListItem(BuildContext buildContext, int index) {
    // return Image.file(gridItems[index]);
    return ;
  }
}
