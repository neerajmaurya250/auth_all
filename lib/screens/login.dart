import 'package:authall/models/users.dart';
import 'package:authall/screens/dashboard.dart';
import 'package:authall/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'package:toast/toast.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
//form validation

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';

//Check user is logged in or not
  bool _isLoggedIn = false;
  Map userProfile;
  final facebookLogin = FacebookLogin();
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  UserData _userData = UserData();

//Google SignIn
  _loginGoogle() async {
    try {
      await _googleSignIn.signIn();
      setState(() {
        _isLoggedIn = true;
        _userData.profileImage = _googleSignIn.currentUser.photoUrl;
        _userData.name = _googleSignIn.currentUser.displayName;
      });
    } catch (err) {
      print(err);
    }
  }

  //Facebook SignIn
  _loginWithFB() async {
    final result = await facebookLogin.logInWithReadPermissions(['email']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=$token');
        final profile = JSON.jsonDecode(graphResponse.body);
        print(profile);
        setState(() {
          userProfile = profile;
          _isLoggedIn = true;
          _userData.profileImage = userProfile["picture"]["data"]["url"];
          _userData.name = userProfile["name"];
        });
        break;
      case FacebookLoginStatus.cancelledByUser:
        setState(() => _isLoggedIn = false);
        break;
      case FacebookLoginStatus.error:
        setState(() => _isLoggedIn = false);
        break;
    }
  }

  //Logout
  _logout() {
    _googleSignIn.signOut();
    facebookLogin.logOut();

    setState(() {
      _isLoggedIn = false;
      _userData.loginStatus = 2;
      _userData.loginStatus = 1;
      _userData.loginStatus = 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenData = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: _isLoggedIn
            ? Dashboard()
            : Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/bg_image.jpeg"),
                        fit: BoxFit.cover)),
                child: Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: 0.85,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      height: screenData.height * 0.5,
                      width: screenData.width * 1.0,
                      child: Icon(
                        FontAwesomeIcons.heartbeat,
                        color: Colors.red,
                        size: 60,
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: screenData.height * 0.2),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 50.0, right: 50.0),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      TextFormField(
                                        onChanged: (val) {
                                          setState(() => email = val);
                                        },
                                        validator: (val) => val.isEmpty
                                            ? 'Enter username/email'
                                            : null,
                                        cursorColor: Colors.red,
                                        decoration: InputDecoration(
                                            hintText: 'email/username',
                                            hintStyle: TextStyle(fontSize: 20),
                                            labelText: 'USERNAME',
                                            labelStyle: TextStyle(
                                                color: Colors.red,
                                                fontSize: 18),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.red)),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.red))),
                                      ),
                                      TextFormField(
                                        onChanged: (val) {
                                          setState(() => password = val);
                                        },
                                        obscureText: true,
                                        validator: (val) => val.length < 6
                                            ? 'Enter at least 7 char password'
                                            : null,
                                        cursorColor: Colors.red,
                                        decoration: InputDecoration(
                                            hintText: '********',
                                            hintStyle: TextStyle(fontSize: 20),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.red)),
                                            labelText: 'PASSWORD',
                                            labelStyle: TextStyle(
                                                color: Colors.red,
                                                fontSize: 18),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.red))),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Forgot Password?',
                                        style:
                                            TextStyle(color: Colors.grey[500]),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        height: 55,
                                        width: 355,
                                        child: RaisedButton(
                                          onPressed: () async {
                                            dynamic result = await _auth
                                                .signInWithEmailAndPassword(
                                                    email, password);
                                            if (result == null) {
                                              setState(() {
                                                error =
                                                    'please supply valid email';
                                              });
                                            } else {
                                              showToast('welcome');
                                              Navigator.pop(context);
                                            }
                                          },
                                          child: Text(
                                            'LOGIN',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 20),
                                          ),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50.0)),
                                          color: Colors.white,
                                          elevation: 0.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 40, right: 40),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Container(
                                      height: 1,
                                      width: screenData.width * 0.2,
                                      color: Colors.grey[500],
                                    ),
                                    Text(
                                      'OR CONNECT WITH',
                                      style: TextStyle(color: Colors.grey[500]),
                                    ),
                                    Container(
                                      height: 1,
                                      width: screenData.width * 0.2,
                                      color: Colors.grey[500],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    height: 50,
                                    width: 155,
                                    child: FlatButton.icon(
                                      label: Text(
                                        'facebook',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () {
                                        _loginWithFB();
                                      },
                                      color: Color.fromRGBO(66, 103, 178, 1.0),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0)),
                                      icon: Icon(
                                        FontAwesomeIcons.facebook,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    width: 155,
                                    child: FlatButton.icon(
                                      label: Text(
                                        'Google',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () {
                                        _loginGoogle();
                                      },
                                      color: Color.fromRGBO(219, 68, 55, 1.0),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0)),
                                      icon: Icon(
                                        FontAwesomeIcons.google,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
}
