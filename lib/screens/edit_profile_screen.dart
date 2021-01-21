import 'package:bonsai_app/providers/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingsUser>(context);
    return Scaffold(
      backgroundColor: settings.isDark ? Color(0xFF303030) : Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.done),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
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
                        color: settings.isDark
                            ? Colors.white70
                            : Color(0xFF303030),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(); // back to previous screen
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                child: Center(
                  child: InkWell(
                    onTap: () {},
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                color: Colors.black54,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.transparent,
                            backgroundImage: NetworkImage(
                                'https://youraverageguystyle.com/wp-content/uploads/2018/10/Mens-Fashion-Blogger-ASOS-Grey-T-Shirt-Aviators-Teal-Orange.jpg'),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          right: 5,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.green,
                            child: Icon(
                              Icons.attach_file,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Username',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 350,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: const Offset(
                        5.0,
                        5.0,
                      ), //Offset
                      blurRadius: 6.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                  border: Border.all(
                    color: Colors.green,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Color(0xFF292929),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 20,
                    left: 10,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Pan Pawel',
                        hintStyle: TextStyle(
                          color: settings.isDark
                              ? Colors.white
                              : Color(0xFF303030),
                        )),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: settings.isDark ? Colors.white : Color(0xFF303030),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Email',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 350,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: const Offset(
                        5.0,
                        5.0,
                      ), //Offset
                      blurRadius: 6.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                  border: Border.all(
                    color: Colors.green,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Color(0xFF292929),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 20,
                    left: 10,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'admin@admin.com',
                        hintStyle: TextStyle(
                          color: settings.isDark
                              ? Colors.white
                              : Color(0xFF303030),
                        )),
                    style: TextStyle(
                      color: settings.isDark ? Colors.white : Color(0xFF303030),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Password',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 350,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: const Offset(
                        5.0,
                        5.0,
                      ), //Offset
                      blurRadius: 6.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                  border: Border.all(
                    color: Colors.green,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Color(0xFF292929),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 20,
                    left: 10,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'password',
                        hintStyle: TextStyle(
                          color: settings.isDark
                              ? Colors.white
                              : Color(0xFF303030),
                        )),
                    obscureText: true,
                    style: TextStyle(
                      color: settings.isDark ? Colors.white : Color(0xFF303030),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
