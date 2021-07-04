import 'dart:convert';
import 'package:http/http.dart' as http;
import 'product_class.dart';

class Sale{
late int sale_number;
late String product_name;
late String emp_name;
late String customer_name;
late int customer_phone;
late int quantity;
late int price;
late int total_bill;

Sale({
  this.product_name="",
  this.price=-1,
  this.quantity=-1,
  this.emp_name="",
  this.customer_name="",
  this.customer_phone=-1,
  this.sale_number=-1,
  this.total_bill=-1
}){ }

void MakeSale(Map obj)async{
  Product prd=new Product();

  //these are some api calls in the production code
  var url=Uri.parse('http://10.0.2.2:5000/sale');
  var prm=jsonEncode({
    "sale_number":"null",
    "product_id":obj['product_id'],
    "emp_id":obj['emp_id'],
    "customer_name":obj['customer_name'],
    "customer_phone":obj['customer_phone'],
    "quantity":obj['quantity'],
    "price":obj['price'],
    "total_bill":obj['total_bill']
  });
  print(prm);
  var response=await http.post(url,headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  },body: prm);

  for(var i=0;i<obj['quantity'];i++) {
    prd.SaleProduct(obj['product_id']);
  }
  print(response.body);
}

}