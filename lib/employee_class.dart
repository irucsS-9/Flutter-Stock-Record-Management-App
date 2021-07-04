import 'dart:convert';
import 'package:http/http.dart' as http;

class Employee{
  late int emp_id;
  late String emp_name;
  late String emp_email;
  late String emp_password;
  late String emp_status;
  Employee({
    this.emp_id=-1,
    this.emp_email="",
    this.emp_name="",
    this.emp_password="",
    this.emp_status=""
  }){ }

  void RemoveEmployee(int id)async{
    var url=Uri.parse('http://10.0.2.2:5000/staff/$id');
    var response=await http.delete(url);
    print(response.body);
  }

  void AddEmployee(Employee obj)async{
    var url=Uri.parse('http://10.0.2.2:5000/staff');
    var prm=jsonEncode({
      "emp_id":"${obj.emp_id}",
      "emp_name":obj.emp_name,
      "emp_email":obj.emp_email,
      "emp_password":obj.emp_password,
      "emp_status":obj.emp_status
    });
    print(prm);
    var response=await http.post(url,headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },body: prm);
    print(response.body);
  }

}