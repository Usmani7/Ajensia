import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

  Future getHomeData() async{
  final response = await http.get(
    'http://ajensia.c2btech.com/api/v1/warehouses?api-key=g48oos0gck8kkko844800w4cw440s80sc80c8kgs',
    //headers: {HttpHeaders.authorizationHeader: "g48oos0gck8kkko844800w4cw440s80sc80c8kgs"},
  );
   return json.decode(response.body);
  }


  Future getTransferData() async{
  final response = await http.get(
    'http://ajensia.c2btech.com/api/v1/transfers?api-key=g48oos0gck8kkko844800w4cw440s80sc80c8kgs',
  );
   return json.decode(response.body);
  }

   Future getSalesData(String myid) async{
  final response = await http.get(
    'http://ajensia.c2btech.com/api/v1/sales?include=items,warehouse&order_by=date,desc&warehouse_id=$myid&api-key=g48oos0gck8kkko844800w4cw440s80sc80c8kgs',
  );
   return json.decode(response.body);
  }

  //    Future getWarehouseData() async{
  // final response = await http.get(
  //   'http://ajensia.c2btech.com/api/v1/products/warehouseqty?warehouse_id=0&api-key=g48oos0gck8kkko844800w4cw440s80sc80c8kgs',
  // );
  //  return json.decode(response.body);
  // }

// String apiurl = 'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$appID&units=metric';

// Future<HomeClass> fetchHome() async {
//   final response = await http.get(
//     'http://ajensia.c2btech.com/api/v1/warehouses',
//     headers: {HttpHeaders.authorizationHeader: "g48oos0gck8kkko844800w4cw440s80sc80c8kgs"},
//   );
//   final responseJson = json.decode(response.body);

//   return HomeClass.fromJson(responseJson);
// }

// class HomeClass {
//   final int id;
//   final String name;

//   HomeClass({this.id, this.name});

//   factory HomeClass.fromJson(Map<String, dynamic> json) {
//     return HomeClass(
//       id: json['data']['id'],
//       name: json['data']['name'],
//     );
//   }
// }
//http://ajensia.c2btech.com/api/v1/warehouses
//g48oos0gck8kkko844800w4cw440s80sc80c8kgs



