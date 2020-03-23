import 'package:authall/models/users.dart';
import 'package:authall/screens/dashboard.dart';
import 'package:authall/screens/home.dart';
import 'package:authall/screens/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);

    // return either the Home or Authenticate widget
    if (user == null){
      return LandingPage();
    } else {
      return Dashboard();
    }

  }
}