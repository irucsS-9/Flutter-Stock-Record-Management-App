import 'package:flutter/material.dart';
import 'sales_class.dart';

class MakeSaleScreen extends StatefulWidget {
  const MakeSaleScreen({Key? key}) : super(key: key);

  @override
  _MakeSaleScreenState createState() => _MakeSaleScreenState();
}

class _MakeSaleScreenState extends State<MakeSaleScreen> {
  Sale obj=new Sale();
  var product_id = TextEditingController();
  var emp_id =TextEditingController();
  var customer_name=TextEditingController();
  var customer_phone=TextEditingController();
  var quantity=TextEditingController();
  var price=TextEditingController();
  var total_bill=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Make A Sale',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 20,
            color: Colors.grey[700],
            fontWeight: FontWeight.w800
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios,
              color: Colors.grey[700],
            )
        ),
        backgroundColor: Colors.grey[200],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(40, 10, 40, 20),
          child: Column(
            children: <Widget>[
              TextField(
                cursorHeight: 25,
                controller: product_id,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Product ID',
                    labelStyle: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w400,
                        fontSize: 14
                    )
                ),
              ),
              SizedBox(height: 10),
              TextField(
                cursorHeight: 25,
                controller: emp_id,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Employee ID',
                    labelStyle: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w400,
                        fontSize: 14
                    )
                ),
              ),
              SizedBox(height: 10),
              TextField(
                cursorHeight: 25,
                controller: customer_name,
                decoration: InputDecoration(
                    labelText: 'Customer Name',
                    labelStyle: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w400,
                        fontSize: 14
                    )
                ),
              ),
              SizedBox(height: 10),
              TextField(
                cursorHeight: 25,
                controller: customer_phone,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Customer Phone',
                    labelStyle: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w400,
                        fontSize: 14
                    )
                ),
              ),
              SizedBox(height: 10),
              TextField(
                cursorHeight: 25,
                keyboardType: TextInputType.number,
                controller: quantity,
                decoration: InputDecoration(
                    labelText: 'Quantity of Product',
                    labelStyle: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w400,
                        fontSize: 14
                    )
                ),
              ),
              SizedBox(height: 10),
              TextField(
                cursorHeight: 25,
                keyboardType: TextInputType.number,
                controller: price,
                decoration: InputDecoration(
                    labelText: 'Purchase Price',
                    labelStyle: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w400,
                        fontSize: 14
                    )
                ),
              ),
              SizedBox(height: 10),
              TextField(
                cursorHeight: 25,
                keyboardType: TextInputType.number,
                controller: total_bill,
                decoration: InputDecoration(
                    labelText: 'Total Bill',
                    labelStyle: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w400,
                        fontSize: 14
                    )
                ),
              ),
              SizedBox(height: 15),
              Container(
                width: 150,
                height: 40,
                child: RaisedButton(
                  onPressed: (){
                    Map data = {
                      'product_id':int.parse(product_id.text),
                      'emp_id':int.parse(emp_id.text),
                      'customer_name':customer_name.text,
                      'customer_phone':int.parse(customer_phone.text),
                      'quantity':int.parse(quantity.text),
                      'price':int.parse(price.text),
                      'total_bill':int.parse(total_bill.text)
                    };
                    obj.MakeSale(data);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Modify',
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 18,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
