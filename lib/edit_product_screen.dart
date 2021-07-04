import 'package:flutter/material.dart';
import 'product_class.dart';

class EditProduct extends StatefulWidget {
  const EditProduct({Key? key}) : super(key: key);

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {

  Map data = { };
  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)?.settings.arguments as Map;
    Product obj=new Product();
    //print(data);
    var name=TextEditingController(text: data['product_name']);
    var id=TextEditingController(text: data['product_id'].toString());
    var quantity=TextEditingController(text: data['quantity'].toString());
    var details=TextEditingController(text: data['details']);
    var purchasePrice=TextEditingController(text: data['purchase_price'].toString());



    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        title: Text('Manage It',
          style: TextStyle(
              fontFamily:'Raleway',
              color: Colors.grey[700],
              fontSize: 22,
              fontWeight: FontWeight.bold
          ),),
        backgroundColor: Colors.grey[200],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(40, 50, 40, 20),
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
            SizedBox(height: 30),
            TextField(
              cursorHeight: 25,
              controller: id,
              readOnly: true,
              decoration: InputDecoration(
                  labelText: 'ID',
                  labelStyle: TextStyle(
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w400,
                      fontSize: 18
                  )
              ),
            ),
            SizedBox(height: 30),
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
            SizedBox(height: 30),
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
            SizedBox(height: 30),
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
            SizedBox(height: 30),
            Container(
              width: 150,
              height: 50,
              child: RaisedButton(
                onPressed: (){
                  obj.id= int.parse(id.text);
                  obj.name=name.text;
                  obj.quantity= int.parse(quantity.text);
                  obj.purchase_price= int.parse(purchasePrice.text);
                  obj.details=details.text;
                  obj.EditProduct(obj);
                  Navigator.pop(context);
                },
                child: Text(
                  'Modify',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 20
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
    );
  }
}
