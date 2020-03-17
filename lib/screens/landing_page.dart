import 'package:authall/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dataScreen = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg_image.jpeg"), fit: BoxFit.cover)),
        child: Stack(
          children: <Widget>[
            Opacity(
              opacity: 0.9,
              child: Container(
                color: Colors.red[400],
              ),
            ),
            Positioned(
              bottom: 130.0,
              width: dataScreen.width * 1.0,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.heartbeat,
                            size: 60,
                            color: Colors.white,
                          ),
                          Text(
                            'heartlink',
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: dataScreen.height * 0.2),
                    SizedBox(
                      height: 50,
                      width: 300,
                      child: OutlineButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                        onPressed: () {},
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: 300,
                      child: OutlineButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Text(
                          'LOG IN',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
