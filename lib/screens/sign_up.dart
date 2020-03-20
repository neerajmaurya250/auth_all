import 'package:authall/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';

//form validation
  @override
  Widget build(BuildContext context) {
    var screenData = MediaQuery.of(context).size;

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
                height: screenData.height * 0.5,
                width: screenData.width * 1.0,
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
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              validator: (val) => val.isEmpty ? 'Name is Required' : null,
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
                              validator: (val) => val.isEmpty ? 'Email required' : null,
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
                              validator: (val) => val.length < 6 ? 'Password must be 7 char long' : null,
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

                                  if(_formKey.currentState.validate()){

                                    dynamic result = await _auth.registerWithEmailAndPassword(email,password);
                                    if(result == null){
                                      setState(() =>error = 'please give valid email');
                                    }

                                  }

                                },
                                child: Text(
                                  'SIGNUP',
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
