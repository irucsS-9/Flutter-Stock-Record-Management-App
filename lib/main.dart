import 'package:dbmsproject/vendor_.dart';
import 'package:flutter/material.dart';
import 'loading_screen.dart';
import 'login_screen.dart';
import 'after_login.dart';
import 'product_.dart';
import 'products_screen.dart';
import 'edit_product_screen.dart';
import 'add_product_screen.dart';
import 'add_vendor.dart';
import 'employee_screen.dart';
import 'add_employee.dart';
import 'sales_screen.dart';
import 'purchase_history_screen.dart';
import 'make_sale.dart';

void main() {
  runApp(MaterialApp(
    home: Loading(),
    routes: {
      'edit_product':(context)=>EditProduct(),
      'product_screen':(context)=>ProductScreen(),
      'add_product':(context)=>AddProduct(),
      'after_login_menu':(context)=>AfterLogin(),
      'add_vendor_Screen':(context)=>AddVendor(),
      'vendor_screen':(context)=>VendorScreen(),
      'employee_screen':(context)=>EmployeeScreen(),
      'add_staff_screen':(context)=>AddEmployeeScreen(),
      'purchase_screen':(context)=>PurchaseHistoryScreen(),
      'sales_screen':(context)=>SalesScreen(),
      'login_screen':(context)=>Login(),
      'make_sale':(context)=>MakeSaleScreen()
    },
  ));
}





