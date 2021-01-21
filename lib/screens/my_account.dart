import 'package:bonsai_app/providers/settings.dart';
import 'package:bonsai_app/screens/add_post_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/app_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'edit_profile_screen.dart';

class MyAccount extends StatelessWidget {
  static const routeName = '/myAccount';

  //final userData =  FirebaseFirestore.instance.collection('users').doc(uid);

  //final imageView = DUMMY_NEWS;

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

  void countDocuments() async {
    QuerySnapshot _myDoc =
        await FirebaseFirestore.instance.collection('posts').get();
    List<DocumentSnapshot> _myDocCount = _myDoc.docs;
    print('AAA');
    print(_myDocCount.length);
    print("BBB");
  }

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingsUser>(context);
    bool isDark = settings.isDark;
    String uid = FirebaseAuth.instance.currentUser.uid;
    var username;
    return Scaffold(
      backgroundColor: isDark ? Color(0xFF303030) : Colors.white,
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection('users').doc(uid).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text(' ');
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
                                        fontWeight: FontWeight.w800,
                                        color: isDark
                                            ? Colors.white70
                                            : Color(0xFF303030),
                                      ),
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
                                      countDocuments();

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
                                    icon: Icon(
                                      Icons.add,
                                      color: isDark
                                          ? Colors.white70
                                          : Color(0xFF303030),
                                    ),
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
                                  icon: Icon(
                                    Icons.menu,
                                    color: isDark
                                        ? Colors.white70
                                        : Color(0xFF303030),
                                  ),
                                  iconSize: 40,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.black54,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
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
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfileScreen()),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.all(20.0),
                              padding: const EdgeInsets.only(
                                  right: 40.0, left: 40.0),
                              child: Text(
                                'Edit profile',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: isDark
                                      ? Colors.white70
                                      : Color(0xFF303030),
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                border: Border.all(
                                  width: 1.0,
                                  color: isDark
                                      ? Colors.white70
                                      : Color(0xFF303030),
                                ),
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
                                  // Image.network(imageView[0].imageUrl),
                                  // Image.network(imageView[1].imageUrl),
                                  // Image.network(imageView[2].imageUrl),
                                  // Image.network(imageView[3].imageUrl),
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
