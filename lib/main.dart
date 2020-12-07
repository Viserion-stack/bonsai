import 'package:bonsai_app/screens/auth_screen.dart';
import 'package:bonsai_app/screens/chat_screen.dart';
import 'package:bonsai_app/screens/my_account.dart';
import 'package:bonsai_app/screens/news.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}




class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (ctx, userSnapshot) {
        if (userSnapshot.hasData) {
          return News();//ChatScreen();
        }
        return AuthScreen();
      }),
      routes: {
                News.routeName: (ctx) => News(),
                MyAccount.routeName: (ctx) => MyAccount(),
                // OrdersScreen.routeName: (ctx) => OrdersScreen(),
                // UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
                // EditProductScreen.routeName: (ctx) => EditProductScreen(),
                }
                ,
    );
  }
}
