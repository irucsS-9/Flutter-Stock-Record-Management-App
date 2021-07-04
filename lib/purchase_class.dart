
class Purchase{
  late int purchase_id;
  late int product_id;
  late int vendor_id;
  late String vendor_name;
  late String product_name;
  late int quantity;
  late String date;
  late int price;
  late int bill;

Purchase({
this.product_id=-1,
  this.vendor_id=-1,
    this.vendor_name="",
  this.purchase_id=-1,
  this.quantity=-1,
  this.bill=-1,
  this.date="",
  this.price=-1,
  this.product_name=""
}){ }


}