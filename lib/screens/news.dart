import 'package:bonsai_app/model/news_data.dart';
import 'package:bonsai_app/widgets/news_item.dart';
import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class News extends StatelessWidget {
  final displayedNews = DUMMY_NEWS;
  static const routeName = '/news';

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
      body: ListView.builder(
        itemCount: displayedNews.length,
        itemBuilder: (ctx, index) {
          return NewsItem(
            id: displayedNews[index].id,
            description: displayedNews[index].description,
            imageUrl: displayedNews[index].imageUrl,
            isFavorite: displayedNews[index].isFavorite,
          );
        },
      ),
    );
  }
}
