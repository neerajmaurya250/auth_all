import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg_image.jpeg"), fit: BoxFit.cover)
            ),
          child: Stack(
            children: <Widget>[
              Opacity(
                opacity: 0.85,
                child: Container(
                  color: Colors.white,
                ),
              ),

              Positioned(
                left: 185,
                top: 200,
                child: Icon(
                  FontAwesomeIcons.heartbeat,
                  color: Colors.red,
                  size: 60,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.only(left: 50,right: 50),
                      child: Form(
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              validator: (val) => val.isEmpty ? 'Enter username/email' : null,
                              cursorColor: Colors.red,
                              decoration: InputDecoration(
                                  hintText: 'Name',
                                  hintStyle: TextStyle(fontSize: 20),
                                  labelText: 'NAME',
                                  labelStyle:
                                  TextStyle(color: Colors.red, fontSize: 18),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red))),
                            ),
                            TextFormField(
                              validator: (val) => val.isEmpty ? 'Enter username/email' : null,
                              cursorColor: Colors.red,
                              decoration: InputDecoration(
                                  hintText: 'email',
                                  hintStyle: TextStyle(fontSize: 20),
                                  labelText: 'EMAIL',
                                  labelStyle:
                                  TextStyle(color: Colors.red, fontSize: 18),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red))),
                            ),
                            TextFormField(
                              obscureText: true,
                              validator: (val) => val.isEmpty ? 'Enter username/email' : null,
                              cursorColor: Colors.red,
                              decoration: InputDecoration(
                                  hintText: 'password',
                                  hintStyle: TextStyle(fontSize: 20),
                                  labelText: 'PASSWORD',
                                  labelStyle:
                                  TextStyle(color: Colors.red, fontSize: 18),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red))),
                            ),
                             SizedBox(
                               height: 20,
                             ),
                             SizedBox(
                               height: 55,
                               width: 355,
                               child: RaisedButton(
                                onPressed: () async {

                                },
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(color: Colors.red, fontSize: 20),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0)),
                                color: Colors.white,
                                elevation: 0.0,
                            ),
                             ),




                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )

            ],
          ),
    )
    );
  }
}
