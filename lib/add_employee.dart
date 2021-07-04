import 'package:flutter/material.dart';
import 'employee_class.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({Key? key}) : super(key: key);

  @override
  _AddEmployeeScreenState createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  Employee obj=new Employee();
  //print(data);
  var name=TextEditingController();
  var id=TextEditingController();
  var email=TextEditingController();
  var password=TextEditingController();
  var status=TextEditingController();

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
          title: Text('Staff Management',
            style: TextStyle(
                fontFamily: 'Raleway',
                color: Colors.grey[700],
                fontSize: 22,
                fontWeight: FontWeight.bold
            ),),
          backgroundColor: Colors.grey[200],
        ),
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: EdgeInsets.fromLTRB(40, 60, 40, 0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  cursorHeight: 25,
                  controller: name,
                  decoration: InputDecoration(
                      labelText: 'Employee Name',
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
                  controller: id,
                  decoration: InputDecoration(
                      labelText: 'Employee ID',
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
                  controller: email,
                  decoration: InputDecoration(
                      labelText: 'Assign an Email',
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
                  controller: password,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      labelText: 'Password',
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
                  controller: status,
                  decoration: InputDecoration(
                      labelText: 'Status of Employee',
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
                    onPressed: () {
                      obj.emp_name=name.text;
                      obj.emp_id=int.parse(id.text);
                      obj.emp_password=password.text;
                      obj.emp_email=email.text;
                      obj.emp_status=status.text;
                      obj.AddEmployee(obj);
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
        )
    );
  }}