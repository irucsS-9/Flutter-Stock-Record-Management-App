import 'package:flutter/material.dart';


class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios,
            color: Colors.grey[700],
            )
    ),
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
          child: Align(
            alignment: Alignment.center,
            child: Container(
              height: 200,
              padding: EdgeInsets.all(10),
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
                      onPressed: (){},
                      padding: EdgeInsets.fromLTRB(0,18,0,0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Column(
                          children:<Widget>[Icon(Icons.laptop,
                            size: 70,
                            color: Colors.grey[800],
                          ),
                            SizedBox(height:2),
                            const Text(
                              'Laptops',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                fontSize: 20,
                              ),
                            )
                          ])
                  ),
                  RaisedButton(
                      color: Colors.white,
                      onPressed: (){},
                      padding: EdgeInsets.fromLTRB(0,18,0,0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Column(
                          children:<Widget>[Icon(Icons.shopping_bag,
                            size: 70,
                            color: Colors.grey[800],
                          ),
                            SizedBox(height:2),
                            const Text(
                              'Bags',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                fontSize: 20,
                              ),
                            )
                          ])
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
