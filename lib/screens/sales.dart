import 'package:flutter/material.dart';
import 'package:mobile_app_safade/screens/sales.dart';
import 'package:mobile_app_safade/screens/transfer.dart';
//import 'package:mobile_app_safade/screens/warehouse.dart';
import 'package:flutter_section_table_view/flutter_section_table_view.dart';
import '../repository/home.dart';

class Sales extends StatefulWidget {
   final String productid;
   Sales(this.productid);
  @override
  _SalesState createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  String productid;
  @override
  void initState() {
    super.initState();
    productid = widget.productid;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text('Sale Details'),
    ),
     body: Center(
            child: FutureBuilder(
            future: getSalesData(productid),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Map content = snapshot.data;
                debugPrint(content.toString());
                return 
    SafeArea(
        child: SectionTableView(
          sectionCount: content['data'].length,
          numOfRowInSection: (section) {
            return section = content['data'].length;
          },
          cellAtIndexPath: (section, row) {
          //  double total = (content['data'][row]['total']);
          //  double total = (content['data'][row]['total']);
          //  double total = (content['data'][row]['total']);

            return Container(
              height: 44.0,
              child: Center(
                child: Row(
                  children: <Widget>[
                    Expanded(child: Text(content['data'][row]['items'][0]['product_name']),),
                    Expanded(child: Text(content['data'][row]['warehouse']['name']),),
                    Expanded(child: Text('jj'),),
                    Expanded(child: Text(content['data'][row]['items'][0]['unit_price']),),
                  ],
                ),
              ),
            );
          },
          headerInSection: (section) {
            return Container(
              height: 25.0,
              color: Colors.grey,
              child: Center(child: Text(content['data'][section]['date']),),
            );
          },
          divider: Container(
            color: Colors.green,
            height: 1.0,
          ),
        ),
    );
              }
            else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner.
              return CircularProgressIndicator();
            }
            
            ),
     ),
  );

}

