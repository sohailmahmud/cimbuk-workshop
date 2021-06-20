import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MuviAppLocalizations {
  final Locale locale;

  static const LocalizationsDelegate<MuviAppLocalizations> delegate = _MuviAppLocalizationsDelegate();

  MuviAppLocalizations(this.locale);

  static MuviAppLocalizations of(BuildContext context) {
    return Localizations.of<MuviAppLocalizations>(context, MuviAppLocalizations);
  }

  Map<String, String> _localizedStrings;

  Future<bool> load() async {
    // Load the language JSON file from the "lang" folder
    String jsonString = await rootBundle.loadString('lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  // This method will be called from every widget which needs a localized text
  String translate(String key) {
    return _localizedStrings[key];
  }
}

class _MuviAppLocalizationsDelegate extends LocalizationsDelegate<MuviAppLocalizations> {
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const _MuviAppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ['en', 'fr', 'af', 'de', 'es', 'id', 'pt', 'tr', 'hi'].contains(locale.languageCode);
  }

  @override
  Future<MuviAppLocalizations> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    MuviAppLocalizations localizations = new MuviAppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_MuviAppLocalizationsDelegate old) => true;
}

String keyString(BuildContext context, String key) {
  return MuviAppLocalizations.of(context).translate(key);
}
