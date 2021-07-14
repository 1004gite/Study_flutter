import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //위쪽에서 기본적인 테마를 정한 후 아래의 내용은 HelloPage에서 관리
      home: HelloPage('Hello World')
    );
  }
}



//안드로이드 스튜디오 기준 stf로 상태변경 가능한 위젯 생성
class HelloPage extends StatefulWidget {
  final String title;

  HelloPage(this.title) : super();

  @override
  _HelloPageState createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //여기서 wiget은 HellpPage 객체를 나타냄, this와 비슷한 개념
        title: Text(widget.title),
      ),
      body: Text('Flutter Test App', style: TextStyle(fontSize: 30)),
    );
  }
}
