//import 'dart:js';

import 'package:bonsai_app/auth_data.dart';
import 'package:bonsai_app/select_page.dart';
import 'package:provider/provider.dart';
import 'package:bonsai_app/screens/account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            builder: (context) => SelectPage(),
          )
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _keyFormEmail = GlobalKey<FormState>();
  final _keyFormPass = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  String _userEmail = '';
  String _userPassword = '';
  //String _userName = '';

  Map<String, String> _authLogin = {
    'email': '',
    'password': '',
  };

  void _tryLogin() {
    if (emailController.text == authData[0].email &&
        passwordController.text == authData[0].password) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AccountScreen(),
          ));
    } else
      print('zly login lub haslo'); //Create snackbar here
  }

  void _trySubmit() {
    final isValidEmail = _keyFormEmail.currentState.validate();
    final isValidPass = _keyFormPass.currentState.validate();
    FocusScope.of(context).unfocus();

    if (isValidEmail && isValidPass) {
      _keyFormEmail.currentState.save();
      _keyFormPass.currentState.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.green[200],
                  Colors.green[400],
                  Colors.green,
                  Colors.green[600],
                ],
              ),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 90,
                ),
                Container(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Text(
                    'bonsai',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Pacifico',
                      fontSize: 80.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.6,
                    ),
                  ),
                ),
                Container(
                  //height: double.infinity,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 40.0,
                    ),
                    //physics: AlwaysScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: Colors.green[400],
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6.0,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          height: 60.0,
                          child: Form(
                            key: _keyFormEmail,
                            child: TextFormField(
                              validator: (value) {
                                if (value.isEmpty || !value.contains('@')) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                              //controller: emailController,
                              onSaved: (value) {
                                //_authLogin['email'] = value;
                                _userEmail = value;
                              },
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                  top: 14.0,
                                ),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                                hintText: 'Enter your Email',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Password',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: Colors.green[400],
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6.0,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          height: 60.0,
                          child: Form(
                            key: _keyFormPass,
                            child: TextFormField(
                              validator: (value) {
                                if (value.isEmpty || value.length < 6) {
                                  return 'Password must be at  least 6 characters long';
                                }
                                return null;
                              },
                              //controller: passwordController,
                              onSaved: (value) {
                                //_authLogin['password'] = value;
                                _userEmail = value;
                              },
                              obscureText: true,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                  top: 14.0,
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.white,
                                ),
                                hintText: 'Enter your Password',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: SizedBox(
                            width: 120,

                            //decoration: BoxDecoration(color: Colors.white60),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.green),
                              ),
                              onPressed: _trySubmit,

                              //color: Colors.white60,
                              child: Text(
                                'Login',
                                style: TextStyle(color: Colors.green),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
