import 'package:bonsai_app/screens/account_screen.dart';
import 'package:flutter/material.dart';

class AddPostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 26,
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 100),
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        size: 50,
                        //color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AccountScreen()),
                        );
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(color: Colors.grey[800]),
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: FlatButton(
                        onPressed: (){},
                          child: Text(
                        'Add new photo',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      //color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 20,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10.0),
                          border: InputBorder.none,
                          hintText: 'Comment to photo',
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.green[900],
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      child: FlatButton(
                        child: Text(
                          'Done',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
