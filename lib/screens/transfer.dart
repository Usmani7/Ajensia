import 'package:flutter/material.dart';
import 'package:mobile_app_safade/screens/home.dart';
//import 'package:mobile_app_safade/screens/sales.dart';
import 'package:mobile_app_safade/screens/transfer.dart';
//import 'package:mobile_app_safade/screens/warehouse.dart';
//import '../repository/beer_repository.dart';
//import '../models/beer.dart';
import '../repository/home.dart';

class Transfer extends StatefulWidget {
  @override
  _TransferState createState() => _TransferState();
}

class _TransferState extends State<Transfer> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Transfer'),
        ),
        //body:
        body: Center(
            child: FutureBuilder(
            future: getTransferData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Map content = snapshot.data;
                debugPrint(content.toString());
                //return Text('data found');
                return new Column(
            children: [
                    new ListTile(
        title: Row(
            children: <Widget>[
              new Expanded(child: new Text("Date")),
              new Expanded(child: new Text("From")),
              new Expanded(child: new Text("To")),
              new Expanded(child: new Text("Total")),

            ]
        ),
      ),


          new Expanded(child:Container(
            child: ListView.builder(
              itemCount: content['data'].length,
              itemBuilder: (BuildContext context, int index) {
                  return new ListTile(                //return new ListTile(
                      title: new Row(
                          children: <Widget>[
                            new Expanded(child: new Text(content['data'][index]['date'].toString())),
                            new Expanded(child: new Text(content['data'][index]['from_warehouse']['name'])),
                            new Expanded(child: new Text(content['data'][index]['to_warehouse']['name'])),
                            new Expanded(child: new Text(content['data'][index]['grand_total'].toString())),

                          ]
                      )
                );
              }, //itemBuilder

            ),
          ),
        ),
      ]
    );
              }
            else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
            )
        ),
      //child: 
        
        
);
}
}