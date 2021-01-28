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

  List<String> posts = [];

  MyAccount({Key key, this.posts}) : super(key: key);

  //final userData =  FirebaseFirestore.instance.collection('users').doc(uid);

  //final imageView = DUMMY_NEWS;

  void _onPressedBottomSheet(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60.0), topRight: Radius.circular(60.0)),
        ),
        context: context,
        builder: (builder) {
          return Container(
              //width: MediaQuery.of(context).size.width,
              //color: Colors.transparent,
              height: 180,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                   Padding(
                     padding: const EdgeInsets.only(left: 100.0),
                     child: ListTile(
                       onTap: (){},
                            leading: Icon(Icons.settings, size: 26),
                            title: Text(
                              'Settings',
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            )),
                   ),
                    
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                     padding: const EdgeInsets.only(left: 100.0),
                     child: ListTile(
                       onTap: (){},
                            leading: Icon(Icons.logout, size: 26),
                            title: Text(
                              'Logout',
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            )),
                   ),
                ],
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser.uid;

    void countDocuments() async {
      QuerySnapshot _myDoc =
          await FirebaseFirestore.instance.collection('posts').get();
      List<DocumentSnapshot> _myDocCount = _myDoc.docs;
      print('AAA');
      print(_myDocCount.length);
      print("BBB");
    }

    final settings = Provider.of<SettingsUser>(context);
    bool isDark = settings.isDark;

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
                                children: List.generate(posts.length,
                                    (index) => Image.network(posts[index])),
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
