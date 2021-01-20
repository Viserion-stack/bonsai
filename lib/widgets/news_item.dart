
import 'package:bonsai_app/providers/settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final settings = Provider.of<SettingsUser>(context);
    String userName;
    final uid = FirebaseAuth.instance.currentUser.uid;
    var pict =
        'https://youraverageguystyle.com/wp-content/uploads/2018/10/Mens-Fashion-Blogger-ASOS-Grey-T-Shirt-Aviators-Teal-Orange.jpg';
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection('users').doc(uid).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text(' '),
            );
          }
          userName = snapshot.data['username'];
          return InkWell(
            onTap: () {},
            child: Card(
              color: settings.isDark ? Color(0xFF282828) : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 4,
              margin: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  ListTile(
                    //tileColor: settings.isDark ? Colors.black54 : Colors.white,
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        pict, // picture of user
                        //'https://youraverageguystyle.com/wp-content/uploads/2018/10/Mens-Fashion-Blogger-ASOS-Grey-T-Shirt-Aviators-Teal-Orange.jpg',
                      ),
                    ),
                    title: Text(
                      userName,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: settings.isDark ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      imageUrl.toString(),
                      height: 460, // high of added picture
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
                              Icon(
                                Icons.favorite_border,
                                color: settings.isDark
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              Icon(
                                Icons.mode_comment,
                                color: settings.isDark
                                    ? Colors.white
                                    : Colors.black,
                              ),
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
                                color: settings.isDark
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
          );
        });
  }
}
