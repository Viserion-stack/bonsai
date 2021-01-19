import 'package:bonsai_app/providers/settings.dart';
import 'package:bonsai_app/screens/news.dart';
import 'package:bonsai_app/widgets/app_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

import 'add_post_screen.dart';
import 'my_account.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  static const routeName = '/homeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  dynamic getSettings;
  bool isDark = false;
  bool isNotif = false;

  final uid = FirebaseAuth.instance.currentUser.uid;

  Future<dynamic> getData() async {
    final DocumentReference document =
        FirebaseFirestore.instance.collection('users').doc(uid);
    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      setState(() {
        isDark = snapshot.data()['isDark'];
        isNotif = snapshot.data()['isNotifications'];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingsUser>(context);
    final List<Widget> _pages = [
      News(
        isDark: settings.isDark,
      ),
      AddPostScreen(),
      MyAccount(),
    ];

    final uid = FirebaseAuth.instance.currentUser.uid;
    FirebaseFirestore.instance.collection('users').doc(uid).get();
    settings.setValues(
      isDark,
      isNotif,
    );

    print(_selectedPageIndex);
    return Scaffold(
      //backgroundColor: settings.isDark ? Color(0xFF303030) : Colors.white,
      drawer: AppDrawer(),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: (isDark == true) ? Color(0xFF303030) : Colors.white,
        //currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              color: _selectedPageIndex == 0 ? Colors.green : Colors.grey,
              size: 36,
            ),
            title: Text('HOME'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesome.plus_circle,
              color: _selectedPageIndex == 1 ? Colors.green : Colors.grey,
              size: 36,
            ),
            title: Text('CALENDAR'),
            
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesome.user_circle,
              color: (_selectedPageIndex == 2) ? Colors.green : Colors.grey,
              size: 36,
            ),
            title: Text('PROFILE'),
          ),
        ],
        onTap: _selectPage,
      ),
      body: _pages[_selectedPageIndex],
    );
  }
}
