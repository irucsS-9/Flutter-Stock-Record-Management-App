import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'purchase_class.dart';

class PurchaseHistoryScreen extends StatefulWidget {
  const PurchaseHistoryScreen({Key? key}) : super(key: key);

  @override
  _PurchaseHistoryScreenState createState() => _PurchaseHistoryScreenState();
}

class _PurchaseHistoryScreenState extends State<PurchaseHistoryScreen> {
  Future<List<Purchase>> getdata()async{
    var url=Uri.parse('http://10.0.2.2:5000/purchase');
    var response = await http.get(url);
    var jsondata=jsonDecode(response.body);
    List<Purchase> data=[];
    for(var i in jsondata)
    {
      Purchase p=Purchase(purchase_id:  i['purchase_id'],
          vendor_name: i['vendor_name'],
          price: i['price'], bill: i['bill'],
          quantity: i['quantity'],date: i['purchase_date'],
          product_name: i['product_name'],product_id: i['product_id'],
        vendor_id: i['vendor_id']
      );
      data.add(p);
    }

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios,
              color: Colors.grey[700],
            )
        ),
        centerTitle: true,
        title: Text('Purchase History',
          style: TextStyle(
              fontFamily:'Raleway',
              color: Colors.grey[700],
              fontSize: 22,
              fontWeight: FontWeight.bold
          ),),
        backgroundColor: Colors.grey[200],
      ),
      body: FutureBuilder(
        future: getdata(),
        builder: (BuildContext context,AsyncSnapshot snapshot){
          if(snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 190,
                  child: Card(
                    color: Colors.lightGreen[100],
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 15),
                          Text(
                            'Product Name : ' +
                                snapshot.data[index].product_name,
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Vendor Name : ' +
                                snapshot.data[index].vendor_name,
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w800
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Product ID : ' +
                                snapshot.data[index].product_id.toString(),
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Quantity : ' +
                                snapshot.data[index].quantity.toString(),
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Purchase Price : ' +
                                snapshot.data[index].price.toString(),
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Total Bill : ' +
                                snapshot.data[index].bill.toString(),
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: EdgeInsets.only(left: 250),
                            child: Text(
                              snapshot.data[index].date.toString(),
                              style: TextStyle(
                                color: Colors.brown,
                                  fontSize: 10,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          else if(snapshot.hasError){
            return Text("${snapshot.error}");
          }
          return Center(child:CircularProgressIndicator());
        },
      ),
    );
  }
}
