import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  TextEditingController textEditingController = TextEditingController();

  //dispose는 클래스가 소멸할 때 호출된다.
  @override
  void dispose() {
    //textEdtingController는 클래스 소멸시 dispose함수로 메모리를 할당 해제해 주어야 한다.
    textEditingController.dispose();
    super.dispose();
  }

  //build는 클래스가 호출될 때 호출된다.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  _buildAppbar() {
    return AppBar(
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.send)
        ),
      ],
    );
  }

  _buildBody() {
    return Column(
      children: [
        Text('No Image.'),
        TextField(
          decoration: InputDecoration(hintText: '내용을 입력하세요.'),
          controller: textEditingController,
        )
      ],
    );
  }
}
