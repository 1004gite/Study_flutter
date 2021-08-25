import 'dart:io'; //이미지 파일을 위한 import

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreatePage extends StatefulWidget {
  // const CreatePage({Key? key}) : super(key: key);
  final FirebaseUser user;
  CreatePage(this.user);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  TextEditingController textEditingController = TextEditingController();
  late File _image;
  var check = false;
  final _picker = ImagePicker();

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
            onPressed: () {
              //firebase storage에 이미지 업로드
              final firebaseStorageRef = FirebaseStorage.instance
                  .ref()
                  .child('post')
                  .child('${DateTime.now().millisecondsSinceEpoch}.png');
              final task = firebaseStorageRef.putFile(
                _image, StorageMetadata(contentType: 'image/png'));

              //이미지 업로드 후 정보를 firebase 데이터베이스에 저장
              task.onComplete.then((value) {
                var downUrl = value.ref.getDownloadURL();
                downUrl.then((uri) {
                  var doc = Firestore.instance.collection('post').document();
                  doc.setData({
                    'id': doc.documentID,
                    'photoUrl': uri.toString(),
                    'contents': textEditingController.text,
                    'email': widget.user.email,
                    'displayName': widget.user.displayName,
                    'userPhotoUrl': widget.user.photoUrl
                  }).then((value) {
                    Navigator.pop(context);
                  });
                });
              });
            },
            icon: Icon(Icons.send)
        ),
      ],
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          (!check)? Text('No Image.') : Image.file(_image),
          TextField(
            decoration: InputDecoration(hintText: '내용을 입력하세요.'),
            controller: textEditingController,
          )
        ],
      ),
    );
  }

  Future<void> _getImage() async {
    //Future는 3가지 상태를 가지는 dart언어의 타입이다.
    //await는 비동기를 이용할 떄 사용
    var image = await _picker.pickImage(source: ImageSource.gallery);
    File file = File(image!.path);
    setState(() { //사진이 선택되면 화면이 바뀌어야 하므로 setState사용
      _image = file;
      check = true;
    });
  }
}
