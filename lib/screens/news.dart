//import 'package:bonsai_app/model/news_data.dart';
import 'package:bonsai_app/providers/settings.dart';
import 'package:bonsai_app/widgets/news_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/app_drawer.dart';
import 'add_post_screen.dart';

class News extends StatefulWidget {
  bool isDark;
  News({Key key, this.isDark}) : super(key: key);
  static const routeName = '/news';

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {


  @override
  Widget build(BuildContext context) {
    
    final settings = Provider.of<SettingsUser>(context);

    return Scaffold(
      backgroundColor: settings.isDark ? Color(0xFF303030) : Colors.white,
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

          print('isDark '+settings.isDark.toString());
          print('isNotif '+settings.isNotifications.toString());
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
