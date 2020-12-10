import 'package:bonsai_app/model/news_data.dart';
import 'package:bonsai_app/screens/add_post_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyAccount extends StatelessWidget {
  static const routeName = '/myAccount';

  //final userData =  FirebaseFirestore.instance.collection('users').doc(uid);

  final imageView = DUMMY_NEWS;

  void _onPressedBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              width: MediaQuery.of(context).size.width,
              height: 180,
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20),
                    topRight: const Radius.circular(20),
                  )),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Icon(Icons.arrow_drop_down),
                  ),
                  Center(
                    child: Text('authData'),
                  ),
                ],
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser.uid;
    var username ;
    return Scaffold(
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection('users').doc(uid).get(),
        builder: (context, snapshot) {
             if(snapshot.connectionState == ConnectionState.waiting){
            return Text('Loading');
          }
          username = snapshot.data['username'];
          return Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 50, bottom: 20),
                                  child: Container(
                                    child: Text(
                                      username,
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 110, right: 5, bottom: 20),
                                  child: IconButton(
                                    onPressed: () {
                                      var firebaseUser =
                                          FirebaseAuth.instance.currentUser;
                                      FirebaseFirestore.instance
                                          .collection("users")
                                          .doc(firebaseUser.uid)
                                          .get()
                                          .then((value) {
                                       // print(value.data()["username"]);
                                      });

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AddPostScreen()),
                                      );
                                    },
                                    icon: Icon(Icons.add),
                                    iconSize: 40,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 20,
                                ),
                                child: IconButton(
                                  onPressed: () =>
                                      _onPressedBottomSheet(context),
                                  icon: Icon(Icons.menu),
                                  iconSize: 40,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage(
                                  'https://youraverageguystyle.com/wp-content/uploads/2018/10/Mens-Fashion-Blogger-ASOS-Grey-T-Shirt-Aviators-Teal-Orange.jpg'),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              margin: const EdgeInsets.all(20.0),
                              padding: const EdgeInsets.only(
                                  right: 40.0, left: 40.0),
                              child: Text(
                                'Edit profile',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                border: Border.all(width: 1.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(19.0),
                              child: GridView.count(
                                //childAspectRatio: 1/2,
                                crossAxisCount: 3,
                                crossAxisSpacing: 2.0,
                                mainAxisSpacing: 2.0,
                                children: <Widget>[
                                  Image.network(imageView[0].imageUrl),
                                  Image.network(imageView[1].imageUrl),
                                  Image.network(imageView[2].imageUrl),
                                  Image.network(imageView[3].imageUrl),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Container(
          padding: EdgeInsets.only(left: 45),
          child: Text(
            'my account',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Pacifico',
              fontSize: 40,
            ),
          ),
        ),
      ),
    );
  }
}
