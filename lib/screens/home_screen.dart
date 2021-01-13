
import 'package:bonsai_app/screens/news.dart';
import 'package:bonsai_app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';



import 'add_post_screen.dart';
import 'my_account.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  static const routeName = '/homeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _pages = [
    News(),
    AddPostScreen(),
    MyAccount(),
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      
      bottomNavigationBar: BottomNavigationBar(
        //currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Feather.home,
              color: Colors.grey,
            ),
            title: Text('HOME'),
            activeIcon: Icon(
              Feather.home,
              color: Colors.purple,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesome.plus_circle,
              color: Colors.grey,
            ),
            title: Text('CALENDAR'),
            activeIcon: Icon(
              FontAwesome.plus_circle,
              color: Colors.purple,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              EvilIcons.user,
              color: Colors.grey,
              size: 36,
            ),
            title: Text('PROFILE'),
            activeIcon: Icon(
              EvilIcons.user,
              color: Colors.purple,
              size: 36,
            ),
          ),
        ],
        onTap: _selectPage,
      ),
      body: _pages[_selectedPageIndex],
    );
  }
}
