mixin ToAlias {}

@deprecated
class CElement = QIBusCountryCode with ToAlias;

/// Country element. This is the element that contains all the information
class QIBusCountryCode {
  /// the name of the country
  String name;

  /// the flag of the country
  String flagUri;

  /// the country code (IT,AF..)
  String code;

  /// the dial code (+39,+93..)
  String dialCode;

  QIBusCountryCode({this.name, this.flagUri, this.code, this.dialCode});

  @override
  String toString() => "$dialCode";

  String toLongString() => "$name ($code)";

  String toCountryCodeString() => "$dialCode";

  String toCountryStringOnly() => '$name';
}
