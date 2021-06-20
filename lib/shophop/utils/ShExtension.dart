import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:intl/intl.dart';
import 'package:prokit_flutter/shophop/models/ShAddress.dart';
import 'package:prokit_flutter/shophop/models/ShAttribute.dart';
import 'package:prokit_flutter/shophop/models/ShCategory.dart';
import 'package:prokit_flutter/shophop/models/ShOrder.dart';
import 'package:prokit_flutter/shophop/models/ShProduct.dart';

callNext(var className, var context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => className),
  );
}

back(var context) {
  Navigator.pop(context);
}

changeStatusColor(Color color) async {
  try {
    await FlutterStatusbarcolor.setStatusBarColor(color, animate: true);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(
        useWhiteForeground(color));
  } on Exception catch (e) {
    print(e);
  }
}

void finish(context) {
  Navigator.pop(context);
}

void hideKeyboard(context) {
  FocusScope.of(context).requestFocus(FocusNode());
}

launchScreen(context, String tag, {Object arguments}) {
  if (arguments == null) {
    Navigator.pushNamed(context, tag);
  } else {
    Navigator.pushNamed(context, tag, arguments: arguments);
  }
}

void launchScreenWithNewTask(context, String tag) {
  Navigator.pushNamedAndRemoveUntil(context, tag, (r) => false);
}

Color hexStringToHexInt(String hex) {
  hex = hex.replaceFirst('#', '');
  hex = hex.length == 6 ? 'ff' + hex : hex;
  int val = int.parse(hex, radix: 16);
  return Color(val);
}

/*
String parseHtmlString(String htmlString) {
  return parse(parse(htmlString).body.text).documentElement.text;
}*/
Future<String> loadContentAsset(String path) async {
  return await rootBundle.loadString(path);
}

Future<List<ShCategory>> loadCategory() async {
  String jsonString =
      await loadContentAsset('assets/shophop_data/category.json');
  final jsonResponse = json.decode(jsonString);
  return (jsonResponse as List).map((i) => ShCategory.fromJson(i)).toList();
}

Future<List<ShProduct>> loadProducts() async {
  String jsonString =
      await loadContentAsset('assets/shophop_data/products.json');
  final jsonResponse = json.decode(jsonString);
  return (jsonResponse as List).map((i) => ShProduct.fromJson(i)).toList();
}

Future<List<ShProduct>> loadCartProducts() async {
  String jsonString =
      await loadContentAsset('assets/shophop_data/cart_products.json');
  final jsonResponse = json.decode(jsonString);
  return (jsonResponse as List).map((i) => ShProduct.fromJson(i)).toList();
}

Future<ShAttributes> loadAttributes() async {
  String jsonString =
      await loadContentAsset('assets/shophop_data/attributes.json');
  final jsonResponse = json.decode(jsonString);
  return ShAttributes.fromJson(jsonResponse);
}

Future<List<ShAddressModel>> loadAddresses() async {
  String jsonString =
      await loadContentAsset('assets/shophop_data/address.json');
  final jsonResponse = json.decode(jsonString);
  return (jsonResponse as List).map((i) => ShAddressModel.fromJson(i)).toList();
}

Future<List<ShOrder>> loadOrders() async {
  String jsonString = await loadContentAsset('assets/shophop_data/orders.json');
  final jsonResponse = json.decode(jsonString);
  return (jsonResponse as List).map((i) => ShOrder.fromJson(i)).toList();
}

Future<List<String>> loadBanners() async {
  List<ShProduct> products = await loadProducts();
  var banner = List<String>();

  products.forEach((product) {
    if (product.images.isNotEmpty) {
      banner.add("images/shophop/img/products" + product.images[0].src);
    }
  });
  return banner;
}

extension StringExtension on String {
  String toCurrencyFormat({var format = '\$'}) {
    return format + this;
  }

  String formatDateTime() {
    if (this == null || this.isEmpty || this == "null") {
      return "NA";
    } else {
      return DateFormat("HH:mm dd MMM yyyy", "en_US")
          .format(DateFormat("yyyy-MM-dd HH:mm:ss.0", "en_US").parse(this));
    }
  }

  String formatDate() {
    if (this == null || this.isEmpty || this == "null") {
      return "NA";
    } else {
      return DateFormat("dd MMM yyyy", "en_US")
          .format(DateFormat("yyyy-MM-dd", "en_US").parse(this));
    }
  }
}

Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}
