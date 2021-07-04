import 'package:dbmsproject/add_product_screen.dart';
import 'package:flutter/material.dart';
import 'product_class.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {


  Future<List<Product>> getdata()async{
     var url=Uri.parse('http://10.0.2.2:5000/product');
     var response = await http.get(url);
     var jsondata=jsonDecode(response.body);
      List<Product> data=[];
      for(var i in jsondata)
        {
          Product p=Product(id: i['product_id'],details: i['details']
              ,purchase_price: i['purchase_price'],
              quantity: i['quantity'],name: i['product_name']);
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddProduct()));
                  //Navigator.pushNamed(context, 'add_product');
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
          title: Text('Manage It',
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
                  height: 200,
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
                            'Product Id : ' +
                                snapshot.data[index].id.toString(),
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Category : ' +
                                snapshot.data[index].name,
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w800
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Details : ' +
                                snapshot.data[index].details,
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
                                snapshot.data[index].purchase_price.toString(),
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: <Widget>[
                              FlatButton.icon(
                                  onPressed: () {
                                    setState(() {
                                      Navigator.pushNamed(
                                          context, 'edit_product', arguments: {
                                        'product_id': snapshot.data[index].id,
                                        'product_name': snapshot.data[index]
                                            .name,
                                        'details': snapshot.data[index].details,
                                        'quantity': snapshot.data[index]
                                            .quantity,
                                        'purchase_price': snapshot.data[index]
                                            .purchase_price
                                      });
                                    });
                                  },
                                  icon: Icon(
                                    Icons.mode_edit,
                                    color: Colors.grey[700],
                                  ),
                                  label: Text("Edit Product",
                                    style: TextStyle(
                                        fontFamily: 'Raleway',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.grey[700]
                                    ),
                                  )),
                              FlatButton.icon(
                                  onPressed: () {
                                    setState(() {
                                      snapshot.data[index].RemoveProduct(
                                          snapshot.data[index].id);
                                    });
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.grey[700],
                                  ),
                                  label: Text("Remove Product",
                                    style: TextStyle(
                                        fontFamily: 'Raleway',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.grey[700]
                                    ),
                                  ))
                            ],
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
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}


