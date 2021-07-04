import 'package:flutter/material.dart';


class AfterLogin extends StatelessWidget {
  const AfterLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        padding: EdgeInsets.all(30),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: GridView.count(
              crossAxisCount: 2,
             padding: EdgeInsets.all(20),
             crossAxisSpacing: 20,
             mainAxisSpacing: 20,
             children: <Widget>[
               RaisedButton(
                 color: Colors.white,
                 onPressed: (){
                   Navigator.pushNamed(context, 'product_screen');
                 },
                   padding: EdgeInsets.fromLTRB(0,18,0,0),
                 shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.all(Radius.circular(20))
                 ),
                 child: Column(
                     children:<Widget>[Icon(Icons.add_circle_outline,
                   size: 50,
                   color: Colors.grey[800],
                 ),
                       SizedBox(height:5),
                       const Text(
                           'Add/Remove\nProduct',
                         textAlign: TextAlign.center,
                         style: TextStyle(
                           fontFamily: 'Raleway',
                           fontSize: 17,
                         ),
                       )
                     ])
               ),
               RaisedButton(
                   onPressed: (){
                     Navigator.pushNamed(context, 'vendor_screen');
                   },
                   color: Colors.white,
                   padding: EdgeInsets.fromLTRB(0,18,0,0),
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.all(Radius.circular(20))
                   ),
                   child: Column(
                       children:<Widget>[Icon(Icons.person,
                         size: 50,
                         color: Colors.grey[800],
                       ),
                         SizedBox(height:5),
                         const Text(
                           'Add/Remove\nVendors',
                           textAlign: TextAlign.center,
                           style: TextStyle(
                             fontFamily: 'Raleway',
                             fontSize: 17,
                           ),
                         )
                       ])
               ),
               RaisedButton(
                   onPressed: (){
                     Navigator.pushNamed(context, 'sales_screen');
                   },
                   color: Colors.white,
                   padding: EdgeInsets.fromLTRB(0,18,0,0),
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.all(Radius.circular(20))
                   ),
                   child: Column(
                       children:<Widget>[Icon(Icons.add_chart,
                         size: 50,
                         color: Colors.grey[800],
                       ),
                         SizedBox(height:5),
                         const Text(
                           'Manage\nSales',
                           textAlign: TextAlign.center,
                           style: TextStyle(
                             fontFamily: 'Raleway',
                             fontSize: 17,
                           ),
                         )
                       ])
               ),
               RaisedButton(
                   onPressed: (){
                     Navigator.pushNamed(context, 'purchase_screen');
                   },
                   color: Colors.white,
                   padding: EdgeInsets.fromLTRB(0,18,0,0),
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.all(Radius.circular(20))
                   ),
                   child: Column(
                       children:<Widget>[Icon(Icons.history_outlined,
                         size: 50,
                         color: Colors.grey[800],
                       ),
                         SizedBox(height:5),
                         const Text(
                           'Purchase\nHistory',
                           textAlign: TextAlign.center,
                           style: TextStyle(
                             fontFamily: 'Raleway',
                             fontSize: 17,
                           ),
                         )
                       ])
               ),
               RaisedButton(
                   onPressed: (){
                     Navigator.pushNamed(context, 'employee_screen');
                   },
                   color: Colors.white,
                   padding: EdgeInsets.fromLTRB(0,18,0,0),
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.all(Radius.circular(20))
                   ),
                   child: Column(
                       children:<Widget>[Icon(Icons.person_outline,
                         size: 50,
                         color: Colors.grey[800],
                       ),
                         SizedBox(height:5),
                         const Text(
                           'Add/Remove\nEmployee',
                           textAlign: TextAlign.center,
                           style: TextStyle(
                             fontFamily: 'Raleway',
                             fontSize: 17,
                           ),
                         )
                       ])
               ),
             ],




          ),
        ),
      )
    );
  }
}
