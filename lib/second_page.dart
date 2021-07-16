import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //위쪽에서 기본적인 테마를 정한 후 아래의 내용은 HelloPage에서 관리
        home: HelloSecond('SecondPage')
    );
  }
}

class HelloSecond extends StatefulWidget {

  String title;

  HelloSecond(this.title) : super();

  @override
  _HelloSecondState createState() => _HelloSecondState();
}

class _HelloSecondState extends State<HelloSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondPage'),
      ),
      body: Column(
        children: [
          Text('This is SecondPage!')
        ],
      ),
    );
  }
}

