import 'package:flutter/widgets.dart';

class T12Category {
  var name = "";
  Color color;
  var icon = "";

  T12Category({this.name, this.color, this.icon});
}

class T12Slider {
  var image = "";
  var balance = "";
  var accountNo = "";

  T12Slider({this.image, this.balance, this.accountNo});
}

class T12Bill {
  var name;
  var day;
  var date;
  var isPaid = false;
  var icon;
  var amount;
  var wallet = "Mastercard";
}

class T12Contact {
  var img;

  var name;

  var isOnline = false;
  var subject;

  var contactno;
}

class T12Transactions {
  var img;
  var type;
  var subType;
  var time;
  double amount;
  var transactionType;
  var transactionDate;

  T12Transactions({this.img, this.type, this.subType, this.time, this.amount,this.transactionType,this.transactionDate});
}

class T12Service{
  var img;
  var serviceName;

  T12Service({this.img, this.serviceName});
}