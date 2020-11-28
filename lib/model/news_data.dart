import 'package:flutter/material.dart';

class NewsData {
  final String id;
  final bool isFavorite;
  final String imageUrl;
  final String description;

  NewsData({
    @required this.id,
    @required this.isFavorite,
    @required this.imageUrl,
    @required this.description,
  });
}

 final DUMMY_NEWS = [
  NewsData(
    id: 'n1',
    description: 'Sunny day and my bonsay!',
    imageUrl: 'https://www.bonsaiempire.pl/great-bonsai-album/acer-bonsai-pall.jpg',
    isFavorite: false, 
  ),
  NewsData(
    id: 'n2',
    description: 'My beautiful tree its fikus!',
    imageUrl: 'https://sklep.tomaszewski.pl/2088-large_default/bonsai-ficus-moyogi.jpg',
    isFavorite: false, 
  ),
  NewsData(
    id: 'n3',
    description: 'Bonsai',
    imageUrl: 'https://pracowniadragon.pl/files/sztuczne%20drzewko%20bonsai%20cis.jpg',
    isFavorite: false, 
  ),
  NewsData(
    id: 'n4',
    description: 'The inhabitants of the Land of the Rising Sun, according to the recipes passed down through the centuries, miniaturize trees and shrubs by placing them in flat containers.',
    imageUrl: 'https://s3.eu-central-1.amazonaws.com/pressland-cms/cache/article_show_cover/so/7561335-okaz-bonsai-uformowany-z-jalowca-przez-caly-rok-zdobi.jpeg',
    isFavorite: false, 
    
  ),
];
