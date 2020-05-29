import 'package:flutter/material.dart';
import 'package:mobile_app_safade/models/beer.dart';
import 'package:mobile_app_safade/repository/beer_repository.dart';
import 'package:mobile_app_safade/screens/warehouse.dart';
class Warehouse extends StatefulWidget {
  @override
  _WarehouseState createState() => _WarehouseState();
}

class _WarehouseState extends State<Warehouse> {
  static List<Beer> _beers = <Beer>[];

  @override
  void initState() {
    super.initState();
    listenForBeers();
  }
  @override
 // static final List<String> _listViewData = _beers[i].name;

  List<ExpansionTile> _listOfExpansions = List<ExpansionTile>.generate(
      _beers.length,
      (i) => ExpansionTile(
            title: Text(_beers[i].name),
            children: _beers
                .map((data) => ListTile(
                      leading: Icon(Icons.person),
                      title: Text('helo'),
                      subtitle: Text("a subtitle here"),
                    ))
                .toList(),
          ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Warehouse Stock'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children:
            _listOfExpansions.map((expansionTile) => expansionTile).toList(),
      ),
    );
  }
        void listenForBeers() async {
    final Stream<Beer> stream = await getBeers();
    stream.listen((Beer beer) =>
      setState(() =>  _beers.add(beer))
    );
  }
}


