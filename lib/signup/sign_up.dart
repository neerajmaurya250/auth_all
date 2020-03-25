import 'package:authall/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toast/toast.dart';

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
  String empId = '';
  String name = '';

//form validation
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg_image.jpeg"), fit: BoxFit.cover)),
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: 0.85,
            child: Container(
              color: Colors.white,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(28.0),
                            child: Icon(
                              FontAwesomeIcons.heartbeat,
                              color: Colors.red,
                              size: 60,
                            ),
                          ),
                          TextFormField(
                            validator: (val) =>
                                val.isEmpty ? 'Name is Required' : null,
                            onChanged: (val) {
                              setState(() => name = val);
                            },
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
                            validator: (val) =>
                                val.isEmpty ? 'Employee ID is required' : null,
                            onChanged: (val) {
                              setState(() => empId = val);
                            },
                            cursorColor: Colors.red,
                            decoration: InputDecoration(
                                hintText: 'Employee ID',
                                hintStyle: TextStyle(fontSize: 20),
                                labelText: 'Employee ID',
                                labelStyle:
                                    TextStyle(color: Colors.red, fontSize: 18),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red)),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red))),
                          ),
                          TextFormField(
                            validator: (val) =>
                                val.isEmpty ? 'Email required' : null,
                            onChanged: (val) {
                              setState(() => email = val);
                            },
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
                            validator: (val) => val.length < 6
                                ? 'Password must be 7 char long'
                                : null,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
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
                                if (_formKey.currentState.validate()) {
                                  dynamic result =
                                      await _auth.registerWithEmailAndPassword(
                                    email,
                                    password,
                                    empId,
                                    name,
                                  );
                                  if (result == null) {
                                    setState(() {
                                      error = 'Please supply a valid email';
                                    });
                                  } else {
                                    showToast('Registerd Successfully');
                                    Navigator.pop(context);
                                  }
                                }
                              },
                              child: Text(
                                'SIGNUP',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 20),
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
            ),
          )
        ],
      ),
    ));
  }

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
}
