import 'package:bonsai_app/screens/my_account.dart';
import 'package:bonsai_app/screens/news.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     String uid = FirebaseAuth.instance.currentUser.uid;
    var username ;
    return Drawer(
      child: Container(
        color: Colors.green,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              child: FutureBuilder(
        future: FirebaseFirestore.instance.collection('users').doc(uid).get(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Text('Loading');
          }
          username = snapshot.data['username'];
          return Text(
                  'Hello '+ username ,
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
                  color: Colors.white,
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
                            color: Colors.grey[800],
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          Icons.home,
                          color: Colors.grey[800],
                          size: 30,
                        ),
                      ),
                      title: Text(
                        'Home',
                        style: TextStyle(
                          color: Colors.black,
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
                            border:
                                Border.all(color: Colors.grey[800], width: 2)),
                        child: Icon(
                          Icons.settings,
                          color: Colors.grey[800],
                          size: 30,
                        ),
                      ),
                      title: Text(
                        'Settings',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        // Navigator.of(context)
                        //     .pushReplacementNamed(OrdersScreen.routeName);
                        // Navigator.of(context).pushReplacement(
                        //   CustomRoute(
                        //     builder: (ctx) => OrdersScreen(),
                        //   ),
                        // );
                      },
                    ),
                    Divider(),
                    ListTile(
                      leading: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(90),
                              border: Border.all(
                                  color: Colors.grey[800], width: 2)),
                          child: Icon(
                            Icons.person,
                            color: Colors.grey[800],
                            size: 30,
                          )),
                      title: Text(
                        'My Account',
                        style: TextStyle(
                          color: Colors.black,
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
                                  color: Colors.grey[800], width: 2)),
                          child: Icon(
                            Icons.exit_to_app,
                            color: Colors.grey[800],
                            size: 30,
                          )),
                      title: Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.black,
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
    );
  }
}
