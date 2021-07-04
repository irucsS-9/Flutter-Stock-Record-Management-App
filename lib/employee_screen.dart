import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'employee_class.dart';


class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({Key? key}) : super(key: key);

  @override
  _EmployeeScreenState createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {

  Future<List<Employee>> getdata()async{
    var url=Uri.parse('http://10.0.2.2:5000/staff');
    var response = await http.get(url);
    var jsondata=jsonDecode(response.body);
    List<Employee> data=[];
    for(var i in jsondata)
    {
      Employee p=Employee(emp_id: i['emp_id'],emp_email: i['emp_email']
          ,emp_password: i['emp_password'],
          emp_status: i['emp_status'],
          emp_name: i['emp_name']);
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
              Navigator.pushNamed(context, 'add_staff_screen');
              },
              child: Icon(
                Icons.person_add,
                size: 30,
                color: Colors.grey[700],
              ),
            ),
          )
        ],
        centerTitle: true,
        title: Text('Staff Management',
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
                  height: 170,
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
                            'Id : ' +
                                snapshot.data[index].emp_id.toString(),
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Name : ' +
                                snapshot.data[index].emp_name,
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w800
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'email : ' +
                                snapshot.data[index].emp_email,
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'status : ' +
                                snapshot.data[index].emp_status,
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
                                      snapshot.data[index].RemoveEmployee(
                                          snapshot.data[index].emp_id);
                                    });
                                  },
                                  icon: Icon(
                                    Icons.person_add_disabled_outlined,
                                    color: Colors.grey[700],
                                  ),
                                  label: Text("Remove Employee",
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
          return Center(child:CircularProgressIndicator());
        },
      ),
    );
  }
}
