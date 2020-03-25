import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    var ScreenData = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.blue[100],
          height: ScreenData.height * 1.0,
          child: Stack(
            children: <Widget>[
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'User Name',
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    Text('Emp. Id',
                        style: TextStyle(color: Colors.white, fontSize: 30)),
                    Text('Email Id',
                        style: TextStyle(color: Colors.white, fontSize: 20))
                  ],
                ),
                height: ScreenData.height * 0.3,
                width: ScreenData.width * 1.0,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.amber[500], Colors.red[600]])),
              ),
              Positioned(
                top: 180,
                left: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(150.0)),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    heightFactor: 0.1,
                    widthFactor: 0.1,
                    child: Image.network(
                        "https://previews.123rf.com/images/triken/triken1608/triken160800029/61320775-male-avatar-profile-picture-default-user-avatar-guest-avatar-simply-human-head-vector-illustration-i.jpg"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
