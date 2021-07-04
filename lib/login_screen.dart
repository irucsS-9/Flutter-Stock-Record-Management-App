import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var email=TextEditingController();
  var pass=TextEditingController();
  int verified=3;

  Future<int> Auth()async{
    var url=Uri.parse('http://10.0.2.2:5000/stafflogin');
    var prm=jsonEncode({
      "email":email.text,
      "password":pass.text
    });
    var response=await http.post(url,headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },body: prm);
    var data = jsonDecode(response.body);
    return data.length;
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          backgroundColor: Colors.grey[100],
          title: new Text("Authentication Error",style: TextStyle(
            fontFamily: 'Raleway',color: Colors.grey[700],fontWeight: FontWeight.w700
          ),),
          content: new Text("Wrong Email or Password",style: TextStyle(
              fontFamily: 'Raleway',color: Colors.grey[700]
          ),),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }



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
      body: SingleChildScrollView(
        child: Column(
          children:<Widget>[
             Align(
               alignment: Alignment.center,
               child: Padding(
                 padding: EdgeInsets.fromLTRB(30, 120, 30, 25),
                 child: TextField(
                   controller: email,
                  cursorHeight: 25,
                   decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                        fontFamily: 'Raleway',
                      fontWeight: FontWeight.w400,
                      fontSize: 25
                    )
                  ),
            ),
               ),
             ),
             Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                child: TextField(
                  controller: pass,
                  cursorHeight: 25,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w400,
                          fontSize: 25
                      )
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.fromLTRB(120, 0, 120, 0),
                child: RaisedButton(
                    color: Colors.grey[300],
                    onPressed: () async {
                      print('here');
                      verified=await Auth();
                      print(verified);
                        if(verified==0){
                          _showDialog();
                        }
                        else {
                            Navigator.pushReplacementNamed(context, 'after_login_menu');
                        }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)
                      ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Login',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w500,
                          fontSize: 25,
                      ),),
                    ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}


