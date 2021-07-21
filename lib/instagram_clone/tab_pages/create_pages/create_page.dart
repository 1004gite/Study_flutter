import 'dart:io'; //이미지 파일을 위한 import

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  TextEditingController textEditingController = TextEditingController();
  late File _image;
  var check = false;

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
        onPressed: _getImage,
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
        (!check)? Text('No Image.') : Image.file(_image),
        TextField(
          decoration: InputDecoration(hintText: '내용을 입력하세요.'),
          controller: textEditingController,
        )
      ],
    );
  }

  Future<void> _getImage() async {
    //Future는 3가지 상태를 가지는 dart언어의 타입이다.
    //await는 비동기를 이용할 떄 사용
    File image = (await ImagePicker().pickImage(source: ImageSource.gallery)) as File;
    setState(() { //사진이 선택되면 화면이 바뀌어야 하므로 setState사용
      _image = image;
      check = true;
    });
  }
}
