import 'package:bonsai_app/model/news_data.dart';
import 'package:bonsai_app/widgets/news_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class News extends StatefulWidget {
  static const routeName = '/news';

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  //final displayedNews = DUMMY_NEWS;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        stream: FirebaseFirestore.instance
            .collection('posts').doc('YcjxgBuVxM99uAdYeJ2b')
            .snapshots(),
        builder: (ctx, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final documents = streamSnapshot.data;
          return ListView.builder(
            itemCount: documents.snapshot.value.length,
            itemBuilder: (ctx, index) => NewsItem(
            id: documents[index]['id'],
            description: documents[index]['description'],
            imageUrl: documents[index]['imageUrl'],
            isFavorite: documents[index]['isFavorite'],),
          
          );
        },
      ),
    );
  }
}


