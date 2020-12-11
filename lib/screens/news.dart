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

Future<int> countDocuments() async {
    QuerySnapshot _myDoc = await FirebaseFirestore.instance.collection('posts').get();
    List<DocumentSnapshot> _myDocCount = _myDoc.docs;
    print('AAA');
    print(_myDocCount.length); 
    print("BBB");
    return _myDocCount.length;
   }
  var len  = countDocuments();

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
            .collection('posts')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
               return ListView(
            children: streamSnapshot.data.docs.map((document){
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
    );
  }
}
