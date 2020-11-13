import 'package:bonsai_app/main.dart';
import 'package:flutter/material.dart';

class MenuSideBar extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;
  MenuSideBar({Key key, this.icon, this.title, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector
    (onTap: onTap,
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
            SizedBox(
              width: 20,
            ),
            Text(title,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 26,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
