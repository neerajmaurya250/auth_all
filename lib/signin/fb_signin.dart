import 'package:authall/models/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

class FbSignIn extends StatefulWidget {
  @override
  _FbSignInState createState() => _FbSignInState();
}

class _FbSignInState extends State<FbSignIn> {

  Map userProfile;
  bool _isLoggedIn = false;
  final facebookLogin = FacebookLogin();
  UserData _userData = UserData();

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



  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
