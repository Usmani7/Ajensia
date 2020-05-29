import 'package:flutter/material.dart';
import 'package:mobile_app_safade/repository/home.dart';
import 'package:mobile_app_safade/screens/sales.dart';
import 'package:mobile_app_safade/screens/transfer.dart';
// import 'package:mobile_app_safade/screens/sales.dart';
// import 'package:mobile_app_safade/screens/transfer.dart';
// import 'package:mobile_app_safade/screens/warehouse2.dart';
import '../repository/home.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  
  // void gettingData() async{
  //   Map data = await getHomeData();
  //   print(data.toString());
  // }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text('Today Sales'),
    ),
    drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                padding: EdgeInsets.all(0.0),
                child: Stack(
                  children: <Widget>[
                 Image.asset(
                  'images/logo.png',
                  height: 900.0,
                  fit: BoxFit.cover,
                  width: 500.0,
                  ),
                  ],
                ),
              ),
              ListTile(
                // onTap: () {
//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => Warehouse()),
//   );
// },
                title: Row(
                  children: <Widget>[
                   Icon(Icons.home),
                   Text("Warehouse"),
                  ],
                ),
              ),
               ListTile(
                  onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Transfer()),
  );
                  },
                title: Row(
                  children: <Widget>[
                   Icon(Icons.transform),
                   Text("Transfer"),
                  ],
                ),
              ),
            ],
          ),
        ),
    body: Center(
            child: FutureBuilder(
            future: getHomeData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Map content = snapshot.data;
                return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: content['data'].length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: ListTile(
onTap: () {
  Navigator.push(
    context,
       // MaterialPageRoute(builder: (context) => Sales()),
        MaterialPageRoute(builder: (context) => Sales(content['data'][index]['id'])),
  );
},
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        title: Text(
          content['data'][index]['name'],
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
        trailing:
            Text('3500  >',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
      ),
      ),
    );
        },
      ),
    );
               // return Text(snapshot.data[0]['id'].toString());
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),

    ),
  );
}

