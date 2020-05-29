// import 'package:flutter/material.dart';
// import '../models/beer.dart';

// class BeerTile extends StatelessWidget {
//   final Beer _beer;
//   BeerTile(this._beer);

//   @override
//   Widget build(BuildContext context) => Column(
//     children: <Widget>[
//       ListTile(
//         title: Text(_beer.name),
//         subtitle: Text(_beer.tagline),
//         leading: Container(
//           margin: EdgeInsets.only(left: 6.0),
//           child: Image.network(_beer.image_url, height: 50.0, fit: BoxFit.fill,)
//         ),
//       ),
//       Divider()
//     ],
//   );
// }

// ListView.builder(
//         scrollDirection: Axis.vertical,
//         shrinkWrap: true,
// //        itemCount: 10,
//         itemBuilder: (BuildContext context, int index) {
//           return Card(
//       elevation: 8.0,
//       margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
//       child: Container(
//         decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
//         child: ListTile(
//         contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//         leading: Container(
//           padding: EdgeInsets.only(right: 12.0),
//           decoration: new BoxDecoration(
//               border: new Border(
//                   right: new BorderSide(width: 1.0, color: Colors.white24))),
//           child: Icon(Icons.autorenew, color: Colors.white),
//         ),
//         title: Text(
//           "Introduction to Driving",
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//         // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
//         trailing:
//             Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0)),
//       ),
//     );
//         },
//       ),

