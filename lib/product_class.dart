import 'dart:convert';

import 'package:http/http.dart' as http;

class Product{

late int id;
late String name;
late String details;
late int quantity;
late int purchase_price;
late int vendor_id;

Product({
   this.id=0,
   this.name="",
   this.details="",
   this.quantity=0,
   this.purchase_price=0}){ }

   void RemoveProduct(int id)async{

   var url=Uri.parse('http://10.0.2.2:5000/product/$id');
   http.delete(url);
   print(id);
   }


   void AddProduct(Product obj)async{
      var url=Uri.parse('http://10.0.2.2:5000/product');
      var date=DateTime.now();
      print(date);
      var prm=jsonEncode({
         "product_id":"${obj.id}",
         "product_name":obj.name,
         "details":obj.details,
         "purchase_price":"${obj.purchase_price}",
         "quantity":"${obj.quantity}",
         "vendor_id":"${obj.vendor_id}",
         "purchase_date":"$date"
      });
      print(prm);
      var response=await http.post(url,headers: <String, String>{
         'Content-Type': 'application/json; charset=UTF-8',
      },body: prm);
      var url2=Uri.parse('http://10.0.2.2:5000/purchase');
      var response2=await http.post(url2,headers: <String, String>{
         'Content-Type': 'application/json; charset=UTF-8',
      },body: prm);

   }

   void EditProduct(Product obj)async{
      var url=Uri.parse('http://10.0.2.2:5000/product/update/$id');

      var prm=jsonEncode({
         "product_id":"${obj.id}",
         "product_name":obj.name,
         "details":obj.details,
         "purchase_price":"${obj.purchase_price}",
         "quantity":"${obj.quantity}",

      });
      var response=await http.put(url,headers: <String, String>{
         'Content-Type': 'application/json; charset=UTF-8',
      },body: prm);
     //print(response.body);
   }

   void SaleProduct(int id)async{
      var url=Uri.parse('http://10.0.2.2:5000/product/sale/$id');
      http.delete(url);
      print(id);
   }



}
