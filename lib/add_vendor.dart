import 'package:flutter/material.dart';
import 'vendor_class.dart';

class AddVendor extends StatefulWidget {
  const AddVendor({Key? key}) : super(key: key);

  @override
  _AddVendorState createState() => _AddVendorState();
}

class _AddVendorState extends State<AddVendor> {
  var name=new TextEditingController();
  var id=new TextEditingController();
  Vendor obj=new Vendor();

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
        title: Text('Manage It',
          style: TextStyle(
              fontFamily:'Raleway',
              color: Colors.grey[700],
              fontSize: 22,
              fontWeight: FontWeight.bold
          ),),
        backgroundColor: Colors.grey[200],
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.fromLTRB(50, 90, 50, 0),
        child: Column(
          children: <Widget>[
            TextField(
              cursorHeight: 25,
              controller: name,
              decoration: InputDecoration(
                  labelText: 'Vendor Name',
                  labelStyle: TextStyle(
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w400,
                      fontSize: 18
                  )
              ),
            ),
            SizedBox(height: 40),
            TextField(
              cursorHeight: 25,
              controller: id,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Vendor ID',
                  labelStyle: TextStyle(
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w400,
                      fontSize: 18
                  )
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: 150,
              height: 50,
              child: RaisedButton(
                onPressed: (){
                  obj.vendor_id=int.parse(id.text);
                  obj.vendor_name=name.text;
                  obj.AddVendor(obj);
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
            )
          ],
        ),
      ),
    );
  }
}
