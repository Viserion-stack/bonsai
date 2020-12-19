import 'dart:io';
import 'package:bonsai_app/screens/my_account.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPostScreen extends StatefulWidget {
  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final commentController = TextEditingController();
  File _pickedImage;
  bool isPhoto = false;

  void _pickImage() async {
    final pickedImageFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 450,
      maxHeight: 450,
    );
    setState(() {
      _pickedImage = pickedImageFile;
    });
    isPhoto = true;
    //widget.imagePickFn(pickedImageFile);
  }

  Future<void> _addPost() async {
    var firebaseUser = FirebaseAuth.instance.currentUser;

    final ref = FirebaseStorage.instance
        .ref()
        .child('posts')
        .child(firebaseUser.uid + '.jpg');

    await ref.putFile(_pickedImage);

    final url = await ref.getDownloadURL();

    FirebaseFirestore.instance.collection('posts').doc().set({
      'id': '555',
      'description': commentController.text.toString(),
      'imageUrl': url,
      'isFavorite': true,
    });
    commentController.clear();
    print('Adding photo...');
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 26,
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 100),
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        size: 50,
                        //color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                    ),
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: _pickedImage == null
                        ? null
                        : FittedBox(
                            child: Image.file(
                              _pickedImage,
                              scale: 50,
                            ),
                            fit: BoxFit.fill,
                          ),
                  ),
                  Center(
                    child: FlatButton(
                      onPressed: _pickImage,
                      child: Text(
                        'Add new photo',
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      //color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: TextFormField(
                        controller: commentController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 20,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10.0),
                          border: InputBorder.none,
                          hintText: 'Comment to photo',
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.green[900],
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      child: FlatButton(
                        child: Text(
                          'Done',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () => _addPost(),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
