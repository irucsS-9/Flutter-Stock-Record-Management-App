import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'sales_class.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({Key? key}) : super(key: key);

  @override
  _SalesScreenState createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  Future<List<Sale>> getdata()async {
    var url=Uri.parse('http://10.0.2.2:5000/sale');
    var response = await http.get(url);
    var jsondata=jsonDecode(response.body);
    List<Sale> data=[];
     for(var i in jsondata)
    {
      Sale p=Sale(sale_number:  i['sale_number'],product_name:  i['product_name']
          ,customer_name:  i['customer_name'],customer_phone: i['customer_phone'],
          quantity: i['quantity'],emp_name:  i['emp_name'],
        price: i['price'],total_bill: i['total_bill']
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
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, 'make_sale');
              },
              child: Icon(
                Icons.add_circle_outline_rounded,
                size: 30,
                color: Colors.grey[700],
              ),
            ),
          )
        ],
        centerTitle: true,
        title: Text('Manage Sales',
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
          if(snapshot.hasData){
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context,int index){
              return Container(
                height: 200,
                child: Card(
                  color: Colors.lightGreen[100],
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  margin: EdgeInsets.fromLTRB(5,10,5,0),
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
                          'Employee : ' +
                              snapshot.data[index].emp_name,
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Customer Name : '+
                              snapshot.data[index].customer_name,
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Customer Contact : '+
                              snapshot.data[index].customer_phone.toString(),
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Quantity : '+
                              snapshot.data[index].quantity.toString(),
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Price : Rs.'+
                              snapshot.data[index].price.toString(),
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Total Bill : Rs.'+
                              snapshot.data[index].total_bill.toString(),
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
        else if(snapshot.hasError){
          return Text('${snapshot.error}');
    }
        return Center(child: CircularProgressIndicator());
      }
      ),
    );
  }
}
