import 'package:bonsai_app/providers/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingsUser>(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: settings.isDark ? Color(0xFF303030) : Colors.white,
        ), //set backgroud color of this screen
        child: Column(
          children: [
            SizedBox(
              height: 26,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 100),
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      size: 50,
                      color: settings.isDark ? Colors.white70 : Color(0xFF303030),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();// back to previous screen
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
