import 'package:bonsai_app/auth_data.dart';
import 'package:flutter/material.dart';

class MyAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 50, bottom: 20),
                        child: Container(
                            child: Text(
                          authData[0].username,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w800),
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 170, right: 10, bottom: 20),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.add),
                          iconSize: 40,
                        ),
                      )
                    ],
                  ),
                  Container(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                          'https://i.pinimg.com/originals/a7/56/66/a7566642c351dabd925330d702e95066.jpg'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      margin: const EdgeInsets.all(20.0),
                      padding: const EdgeInsets.only(right: 40.0, left: 40.0),
                      child: Text(
                        'Edit profile',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        border: Border.all(width: 1.0),
                      ))
                ],
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
