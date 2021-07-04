import 'package:flutter/material.dart';
import 'product_class.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  Product obj=new Product();
  //print(data);
  var name=TextEditingController();
  var id=TextEditingController();
  var quantity=TextEditingController();
  var details=TextEditingController();
  var purchasePrice=TextEditingController();
  var vendorId=TextEditingController();

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
        title: Text('Add A New Product',
          style: TextStyle(
              fontFamily:'Raleway',
              color: Colors.grey[700],
              fontSize: 22,
              fontWeight: FontWeight.bold
          ),),
        backgroundColor: Colors.grey[200],
      ),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.fromLTRB(40, 15, 40, 20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                cursorHeight: 25,
                controller: name,
                decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w400,
                        fontSize: 18
                    )
                ),
              ),
              SizedBox(height: 20),
              TextField(
                cursorHeight: 25,
                controller: id,
                decoration: InputDecoration(
                    labelText: 'ID',
                    labelStyle: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w400,
                        fontSize: 18
                    )
                ),
              ),
              SizedBox(height: 20),
              TextField(
                cursorHeight: 25,
                keyboardType: TextInputType.number,
                controller: quantity,
                decoration: InputDecoration(
                    labelText: 'Quantity',
                    labelStyle: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w400,
                        fontSize: 18
                    )
                ),
              ),
              SizedBox(height: 20),
              TextField(
                cursorHeight: 25,
                controller: details,
                decoration: InputDecoration(
                    labelText: 'Details',
                    labelStyle: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w400,
                        fontSize: 18
                    )
                ),
              ),
              SizedBox(height: 20),
              TextField(
                cursorHeight: 25,
                keyboardType: TextInputType.number,
                controller: purchasePrice,
                decoration: InputDecoration(
                    labelText: 'Purchase Price',
                    labelStyle: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w400,
                        fontSize: 18
                    )
                ),
              ),
              SizedBox(height: 20),
              TextField(
                cursorHeight: 25,
                keyboardType: TextInputType.number,
                controller: vendorId,
                decoration: InputDecoration(
                    labelText: 'Vendor Id',
                    labelStyle: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w400,
                        fontSize: 18
                    )
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 150,
                height: 50,
                child: RaisedButton(
                  onPressed: (){
                  obj.id=int.parse(id.text);
                  obj.name=name.text;
                  obj.purchase_price=int.parse(purchasePrice.text);
                  obj.details=details.text;
                  obj.vendor_id=int.parse(vendorId.text);
                  obj.quantity=int.parse(quantity.text);
                  print('here');
                  obj.AddProduct(obj);
                  Navigator.pop(context);
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 20
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),

                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
