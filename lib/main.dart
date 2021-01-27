import 'package:bonsai_app/screens/auth_screen.dart';
import 'package:bonsai_app/screens/home_screen.dart';
import 'package:bonsai_app/screens/my_account.dart';
import 'package:bonsai_app/screens/news.dart';
import 'package:bonsai_app/screens/search_screen.dart';
import 'package:bonsai_app/screens/settings_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider.value(
      value: SettingsUser(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> userPosts = [];
  //final uid = FirebaseAuth.instance.currentUser.uid;
  int lengthUserPosts = 0;

  Future<dynamic> getDataPosts() async {
    final uid = FirebaseAuth.instance.currentUser.uid;
     QuerySnapshot _myDoc =
        await FirebaseFirestore.instance.collection('posts').get();
    List<DocumentSnapshot> _myDocCount = _myDoc.docs;
    setState(() {
    for(int i =0;i< _myDocCount.length; i++){
      if(_myDocCount[i]['userId'] == uid){
        userPosts.add(_myDocCount[i]['imageUrl']);
      }
    }
    });
    
  }

  @override
  void initState() {
    super.initState();
    getDataPosts();
  }

  @override
  Widget build(BuildContext context) {
    List newList = userPosts;
    
    
    return MaterialApp(
      title: 'Bonsai',
      theme: ThemeData(
        primaryColor: Colors.black,
        backgroundColor: Colors.pink,
        accentColor: Colors.deepPurple,
        accentColorBrightness: Brightness.dark,
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.pink,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, userSnapshot) {
            if (userSnapshot.hasData) {
              return HomeScreen(userPosts: newList); //ChatScreen();
            }
            return AuthScreen();
          }),
      routes: {
        News.routeName: (ctx) => News(),
        MyAccount.routeName: (ctx) => MyAccount(posts: newList),
        SettingsScreen.routeName: (ctx) => SettingsScreen(),
        SearchScreen.routeName: (ctx) => SearchScreen(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
        // OrdersScreen.routeName: (ctx) => OrdersScreen(),
        // UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
        // EditProductScreen.routeName: (ctx) => EditProductScreen(),
      },
    );
  }
}
