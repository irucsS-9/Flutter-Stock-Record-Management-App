import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 5),(){
      Navigator.pushReplacementNamed(context, 'login_screen');
    });

    return Material(
      type: MaterialType.transparency,
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.grey[200],
              alignment: Alignment.topCenter,
              height: 130,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 60, 10, 10),
                child: Text(
                  'Manage it',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]
                  ),
                ),
              ),
            ),
             Padding(
              padding: EdgeInsets.fromLTRB(70, 80, 20, 70),
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 35, 0),
                child: Image(
                  image: AssetImage('assets/loadingvector.png'),
                ),
              ),
            ),
             Row(
               children:<Widget>[
                Align(
                 alignment: Alignment.bottomLeft,
                 child: Padding(
                   padding: EdgeInsets.fromLTRB(10, 60, 0, 0),
                   child: Text(
                     'A Project By : \nBSCS19070\nBSCS19084\nBSCS19045',
                     style: TextStyle(
                       color: Colors.grey[700],
                       fontSize: 20,
                       fontFamily: 'Raleway',
                       fontWeight: FontWeight.w600,

                     ),
                   ),
                 ),
               ),
               ]
             )
          ],
        ),
      )
    );
  }
}
