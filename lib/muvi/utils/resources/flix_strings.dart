import 'package:prokit_flutter/muvi/utils/flix_app_localizations.dart';

const app_name = "Flix";

const walk_titles = ["Welcome to " + app_name, "Welcome to " + app_name, "Welcome to " + app_name];

const walk_sub_titles = [
  "Look back and reflect on your memories and growth over time",
  "Look back and reflect on your memories and growth over time",
  "Look back and reflect on your memories and growth over time"
];

List<String> getGenders(context) {
  return [
    keyString(context, "male"),
    keyString(context, "female"),
  ];
}
