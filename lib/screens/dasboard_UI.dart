import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    var screenData = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          unselectedLabelColor: Colors.white,
          labelColor: Colors.blue[900],
          tabs: <Widget>[
            Tab(
              child: Text('Desk'),
            ),
            Tab(
              child: Text('Desk'),
            )
          ],
          controller: TabController(
              length: 2
          ),
        ),
        iconTheme: IconThemeData(color: Colors.blue[900]),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.blue[900],
              size: 35,
            ),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'trusfi',
          style: TextStyle(
              color: Colors.blue[900],
              fontSize: 40,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(),
      body: SafeArea(
        child: Container(
          //*TODO//
        ),
      ),
    );
  }
}
