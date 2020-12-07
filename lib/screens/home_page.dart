import 'package:bonsai_app/main.dart';
import 'package:bonsai_app/screens/my_account.dart';
import 'package:bonsai_app/screens/news.dart';
import 'package:bonsai_app/select_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



  const int home = 0;
  const int myAccount = 1;
  const int myOthers = 2;
  const int settings = 3;


class HomePage extends StatelessWidget {
  //final Page index;
  // HomePage(this.index);

  Widget _selectedPage(var index) {
    //final int selectedPageIndex = 0;
    switch (index) {
      case 0:
        {
          MyApp();
          //return;
        }
        break;
      case 1:
        {}
        break;
      case 2:
        {}
        break;
      case 3:
        {}
        break;
      default:
        {
          //return;
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final index = Provider.of<SelectPage>(context, listen: true);

    switch (index.index) {
      case home:
          return News();
          break;
      case myAccount:
          return MyAccount();
          break;
      case myOthers:
        {}
        break;
      case settings:
        {}
        break;
      default:
        {
          //return;
        }
        break;
    }
  }
  //child: index,
  // Text('Home Page',
  //     style: TextStyle(
  //       fontWeight: FontWeight.w900,
  //       fontSize: 28,
  //     )),
  //);

}
