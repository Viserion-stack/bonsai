import 'package:bonsai_app/model/news_data.dart';
import 'package:bonsai_app/providers/settings.dart';
import 'package:bonsai_app/widgets/news_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/app_drawer.dart';
import 'add_post_screen.dart';

class News extends StatefulWidget {
  static const routeName = '/news';

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  //final displayedNews = DUMMY_NEWS;
  dynamic getSettings;
  bool isDark = false;
  bool isNotif = false;
  final uid = FirebaseAuth.instance.currentUser.uid;
  Future<dynamic> getData() async {
    final DocumentReference document =
        FirebaseFirestore.instance.collection('users').doc(uid);
    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      setState(() {
        isDark = snapshot.data()['isDark'];
        isNotif = snapshot.data()['isNotifications'];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingsUser>(context);

    final uid = FirebaseAuth.instance.currentUser.uid;
    FirebaseFirestore.instance.collection('users').doc(uid).get();
    settings.setValues(
      isDark,
      isNotif,
    );

    //Try to write function to get data from data base (values of isDark and isNotifications)
    return Scaffold(
      backgroundColor: isDark ? Color(0xFF303030) : Colors.white,
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(left: 95),
          child: Text(
            'news',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Pacifico',
              fontSize: 40,
            ),
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          print('isDark '+isDark.toString());
          print('isNotif '+isNotif.toString());
          return ListView(
            children: streamSnapshot.data.docs.map((document) {
              return NewsItem(
                id: document.data()['id'],
                description: document.data()['description'],
                imageUrl: document.data()['imageUrl'],
                isFavorite: document.data()['isFavorite'],
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddPostScreen()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
