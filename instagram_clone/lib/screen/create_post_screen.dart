import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostScreen extends StatefulWidget {
  final User? user;
  const CreatePostScreen({Key? key, this.user}) : super(key: key);

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  XFile? _image;

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            '새 게시물',
          ),
          actions: [
            IconButton(
              onPressed: () async {
                const snackBar = SnackBar(content: Text('Select a image'));

                if (_image == null) {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  return;
                }

                final firebaseStorageRef = FirebaseStorage.instance
                    .ref()
                    .child('post')
                    .child('${DateTime.now().microsecondsSinceEpoch}.png');
                final task = await firebaseStorageRef.putFile(
                    File(_image!.path),
                    SettableMetadata(contentType: 'image/png'));

                var downloadUrl = task.ref.getDownloadURL();
                downloadUrl.then((url) {
                  var doc = FirebaseFirestore.instance.collection('post').doc();
                  doc.set({
                    'id': doc.id,
                    'photoUrl': url,
                    'contents': _textEditingController.text,
                    'email': widget.user?.email,
                    'displayName': widget.user?.displayName,
                    'userPhotoUrl': widget.user?.photoURL,
                  }).then((onValue) {
                    Navigator.pop(context);
                  });
                });
              },
              icon: const Icon(Icons.send),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _getImage();
          },
        ),
        body: _buildBody());
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _image == null ? Text('No Image') : Image.file(File(_image!.path)),
          TextField(
            decoration: const InputDecoration(hintText: '내용을 입력하세요.'),
            controller: _textEditingController,
          ),
        ],
      ),
    );
  }

  _getImage() async {
    final ImagePicker _picker = ImagePicker();
    var image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }
}
