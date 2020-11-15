import 'package:bonsai_app/model/news_data.dart';
import 'package:bonsai_app/widget/news_item.dart';
import 'package:flutter/material.dart';

class News extends StatelessWidget {
  final displayedNews = DUMMY_NEWS;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: displayedNews.length,
      itemBuilder: (ctx, index) {
        return NewsItem(
          id: displayedNews[index].id,
          description: displayedNews[index].description,
          imageUrl: displayedNews[index].imageUrl,
          isFavorite: displayedNews[index].isFavorite,
        );
      },
    );
  }
}
