import 'package:bonsai_app/providers/settings.dart';
import 'package:bonsai_app/screens/my_account.dart';
import 'package:bonsai_app/screens/news.dart';
import 'package:bonsai_app/screens/settings_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingsUser>(context);
    String uid = FirebaseAuth.instance.currentUser.uid;
    var username;
    return Drawer(
      child: Container(
        color: Colors.green,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                child: FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('users')
                      .doc(uid)
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text(
                        ' ',
                        style: TextStyle(
                          color: settings.isDark ? Colors.white : Colors.black,
                          fontFamily: 'Pacifico',
                          fontSize: 30,
                        ),
                      );
                    }
                    username = snapshot.data['username'];
                    return Text(
                      'Hello ' + username,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Pacifico',
                        fontSize: 30,
                      ),
                    );
                  },
                ),
              ),
              // AppBar(
              //   backgroundColor: Colors.green[900],
              //   title:
              //   automaticallyImplyLeading: false,
              // ),
              //Divider(),
              SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: settings.isDark ? Color(0xFF303030) : Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(220),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(220),
                    ),
                  ),
                  height: MediaQuery.of(context).size.height - 90,
                  //color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 140,
                      ),
                      ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90),
                            border: Border.all(
                              color: settings.isDark
                                  ? Colors.white
                                  : Colors.grey[800],
                              width: 2,
                            ),
                          ),
                          child: Icon(
                            Icons.home,
                            color: settings.isDark
                                ? Colors.white
                                : Colors.grey[800],
                            size: 30,
                          ),
                        ),
                        title: Text(
                          'Home',
                          style: TextStyle(
                            color:
                                settings.isDark ? Colors.white : Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacementNamed(News.routeName);
                        },
                      ),
                      Divider(),
                      ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(90),
                              border: Border.all(
                                  color: settings.isDark
                                      ? Colors.white
                                      : Colors.grey[800],
                                  width: 2)),
                          child: Icon(
                            Icons.settings,
                            color: settings.isDark
                                ? Colors.white
                                : Colors.grey[800],
                            size: 30,
                          ),
                        ),
                        title: Text(
                          'Settings',
                          style: TextStyle(
                            color:
                                settings.isDark ? Colors.white : Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacementNamed(SettingsScreen.routeName);
                        },
                      ),
                      Divider(),
                      ListTile(
                        leading: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(90),
                                border: Border.all(
                                    color: settings.isDark
                                        ? Colors.white
                                        : Colors.grey[800],
                                    width: 2)),
                            child: Icon(
                              Icons.person,
                              color: settings.isDark
                                  ? Colors.white
                                  : Colors.grey[800],
                              size: 30,
                            )),
                        title: Text(
                          'My Account',
                          style: TextStyle(
                            color:
                                settings.isDark ? Colors.white : Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          //MyAccount
                          Navigator.of(context)
                              .pushReplacementNamed(MyAccount.routeName);
                        },
                      ),
                      Divider(),
                      ListTile(
                        leading: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(90),
                                border: Border.all(
                                    color: settings.isDark
                                        ? Colors.white
                                        : Colors.grey[800],
                                    width: 2)),
                            child: Icon(
                              Icons.exit_to_app,
                              color: settings.isDark
                                  ? Colors.white
                                  : Colors.grey[800],
                              size: 30,
                            )),
                        title: Text(
                          'Logout',
                          style: TextStyle(
                            color:
                                settings.isDark ? Colors.white : Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.of(context).pop();
                          Navigator.of(context).pushReplacementNamed('/');

                          // Navigator.of(context)
                          //     .pushReplacementNamed(UserProductsScreen.routeName);
                          // Provider.of<Auth>(context, listen: false).logout();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
