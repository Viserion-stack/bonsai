import 'package:flutter/material.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';

class NewsData {
  final String id;
  final bool isFavorite;
  final String imageUrl;
  final String description;

  NewsData({
    @required this.id,
    this.isFavorite,
    @required this.imageUrl,
    @required this.description,
  });

  Future fetchPost() {
    return null;
  }
}


