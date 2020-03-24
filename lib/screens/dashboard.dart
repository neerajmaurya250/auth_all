import 'package:authall/constants/constant.dart';
import 'package:authall/screens/user_profile.dart';
import 'package:authall/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Text('flexibleSpace'),
            bottom: TabBar(
              tabs: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Desk',
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    'Enquiry',
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Tickets',
                    style: TextStyle(
                     color: Colors.grey[400],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Teams',
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Clients',
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                )
              ],
            ),
             actions: <Widget>[
              PopupMenuButton<String>(

                onSelected: choiceAction,
                itemBuilder: (BuildContext context) {
                  return Constants.choices.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
              )
            ],
/*actions: <Widget>[
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: (){
                  showDialog(context: context,
                    builder: (BuildContext context){
                    return AlertDialog(
                      content: GestureDetector(
                        onTap: ()async{
                          await _auth.signOut();
                          Navigator.pop(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.power_settings_new),
                            SizedBox(width: 10,),
                            new Text("LOGOUT"),
                          ],
                        ),
                      ),
                    );
                    }
                  );
                },
              )
            ],*/


            iconTheme: IconThemeData(color: Colors.blue[900]),
            elevation: 0.0,
            backgroundColor: Colors.white,
            title: Text(
              'trusfi',
              style: TextStyle(
                  color: Colors.blue[900], fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: TabBarView(
            children: <Widget>[
              Container(

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                   Card(
                     child: Column(
                       children: <Widget>[
                         Text('STATS'),
                         Text('3'),
                         Row(
                           children: <Widget>[
                             Column(
                               children: <Widget>[
                                 Text('ACTIVE'),
                                 Text('7')
                               ],
                             ),
                             Column(
                               children: <Widget>[
                                 Text('ACTIVE'),
                                 Text('7')
                               ],
                             ),
                           ],
                         )

                       ],
                     ),
                   ),
                    Card(
                      color: Colors.blue,
                      child: Column(
                        children: <Widget>[
                          Text('STATS'),
                          Text('3'),
                          Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text('ACTIVE'),
                                  Text('7')
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text('ACTIVE'),
                                  Text('7')
                                ],
                              ),
                            ],
                          )

                        ],
                      ),
                    )

                  ],
                ),
              ),
              Center(
                child: Container(
                  child: Text('Enquiries',style: TextStyle(color: Colors.blue,fontSize: 40),),
                ),
              ),
              Center(
                child: Container(
                  child: Text('Tickets',style: TextStyle(color: Colors.blue,fontSize: 40),),
                ),
              ),
              Center(
                child: Container(
                  child: Text('Teams',style: TextStyle(color: Colors.blue,fontSize: 40),),
                ),
              ),
              Center(
                child: Container(
                  child: Text('Clients',style: TextStyle(color: Colors.blue,fontSize: 40),),
                ),
              ),
            ],
          ),
          drawer: Drawer(),
          drawerScrimColor: Colors.blue[200],
          bottomNavigationBar: BottomAppBar(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: new Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.insert_drive_file,
                      size: 30,
                      color: Colors.grey[400],
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.notifications_none,
                      size: 30,
                      color: Colors.grey[400],
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.grey[400],
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.person_outline,
                      size: 30,
                      color: Colors.grey[400],
                    ),
                    onPressed: () {

                      Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile()));
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.message,
                      size: 30,
                      color: Colors.grey[400],
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }

  void choiceAction(String choice) {

    _auth.signOut();
    Navigator.pop(context);



  }

}
