import 'package:bonsai_app/auth_data.dart';
import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  final String id;
  final String description;
  final bool isFavorite;
  final String imageUrl;

  NewsItem({
    @required this.id,
    @required this.description,
    @required this.isFavorite,
    @required this.imageUrl,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.supervised_user_circle,
                ),
              ),
              title: Text(
                authData[0].username,
                style: TextStyle(
                  color: Color(0xFF303030),
                  fontWeight: FontWeight.bold,
                  fontSize: 30
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Icon(Icons.favorite_border),
                        Icon(Icons.mode_comment),
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(),
                    SizedBox(height: 20),
                    Container(
                      child: Text(
                        description,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
