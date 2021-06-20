import 'package:flutter/material.dart';
import 'package:prokit_flutter/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/grocery/utils/GroceryWidget.dart';
import 'package:prokit_flutter/grocery/utils/codePicker/selection_dialog.dart';

import 'QIBusCountry_code.dart';
import 'country_codes.dart';

class CountryCodePicker extends StatefulWidget {
  final ValueChanged<QIBusCountryCode> onChanged;

  //Exposed new method to get the initial information of the country
  final ValueChanged<QIBusCountryCode> onInit;
  final String initialSelection;
  final List<String> favorite;
  final TextStyle textStyle;
  final EdgeInsetsGeometry padding;
  final bool showCountryOnly;
  final InputDecoration searchDecoration;
  final TextStyle searchStyle;
  final WidgetBuilder emptySearchBuilder;
  final Function(QIBusCountryCode) builder;

  /// shows the name of the country instead of the dialcode
  final bool showOnlyCountryWhenClosed;

  /// aligns the flag and the Text left
  ///
  /// additionally this option also fills the available space of the widget.
  /// this is especially usefull in combination with [showOnlyCountryWhenClosed],
  /// because longer countrynames are displayed in one line
  final bool alignLeft;

  /// shows the flag
  final bool showFlag;

  /// contains the country codes to load only the specified countries.
  final List<String> countryFilter;

  CountryCodePicker({
    this.onChanged,
    this.onInit,
    this.initialSelection,
    this.favorite = const [],
    this.countryFilter = const [],
    this.textStyle,
    this.padding = const EdgeInsets.all(0.0),
    this.showCountryOnly = false,
    this.searchDecoration = const InputDecoration(),
    this.searchStyle,
    this.emptySearchBuilder,
    this.showOnlyCountryWhenClosed = false,
    this.alignLeft = false,
    this.showFlag = true,
    this.builder,
  });

  @override
  State<StatefulWidget> createState() {
    List<Map> jsonList = codes;

    List<QIBusCountryCode> elements = jsonList
        .map((s) => QIBusCountryCode(
              name: s['name'],
              code: s['code'],
              dialCode: s['dial_code'],
              flagUri:
                  'https://iqonic.design/themeforest-images/prokit/images/flags/${s['code'].toLowerCase()}.png',
            ))
        .toList();

    if (countryFilter.length > 0) {
      elements = elements.where((c) => countryFilter.contains(c.code)).toList();
    }

    return new _QIBusCountryCodePickerState(elements);
  }
}

class _QIBusCountryCodePickerState extends State<CountryCodePicker> {
  QIBusCountryCode selectedItem;
  List<QIBusCountryCode> elements = [];
  List<QIBusCountryCode> favoriteElements = [];

  _QIBusCountryCodePickerState(this.elements);

  @override
  Widget build(BuildContext context) {
    Widget _widget;
    if (widget.builder != null)
      _widget = InkWell(
        onTap: _showSelectionDialog,
        child: widget.builder(selectedItem),
      );
    else {
      _widget = FlatButton(
        // padding: widget.padding,
        onPressed: _showSelectionDialog,
        child: Flex(
          direction: Axis.horizontal,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              // fit: widget.alignLeft ? FlexFit.tight : FlexFit.loose,
              child: text(
                selectedItem.toCountryCodeString(),
                textColor: grocery_textColorPrimary,
                fontSize: textSizeMedium,
              ),
            ),
          ],
        ),
      );
    }
    return _widget;
  }

  @override
  void didUpdateWidget(CountryCodePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialSelection != widget.initialSelection) {
      if (widget.initialSelection != null) {
        selectedItem = elements.firstWhere(
            (e) =>
                (e.code.toUpperCase() ==
                    widget.initialSelection.toUpperCase()) ||
                (e.dialCode == widget.initialSelection.toString()),
            orElse: () => elements[0]);
      } else {
        selectedItem = elements[0];
      }
    }
  }

  @override
  initState() {
    if (widget.initialSelection != null) {
      selectedItem = elements.firstWhere(
          (e) =>
              (e.code.toUpperCase() == widget.initialSelection.toUpperCase()) ||
              (e.dialCode == widget.initialSelection.toString()),
          orElse: () => elements[0]);
    } else {
      selectedItem = elements[0];
    }

    //Change added: get the initial entered country information
    _onInit(selectedItem);

    favoriteElements = elements
        .where((e) =>
            widget.favorite.firstWhere(
                (f) => e.code == f.toUpperCase() || e.dialCode == f.toString(),
                orElse: () => null) !=
            null)
        .toList();
    super.initState();
  }

  void _showSelectionDialog() {
    showDialog(
      context: context,
      builder: (_) => SelectionDialog(elements, favoriteElements,
          showCountryOnly: widget.showCountryOnly,
          emptySearchBuilder: widget.emptySearchBuilder,
          searchDecoration: widget.searchDecoration,
          searchStyle: widget.searchStyle,
          showFlag: widget.showFlag),
    ).then((e) {
      if (e != null) {
        setState(() {
          selectedItem = e;
        });

        _publishSelection(e);
      }
    });
  }

  void _publishSelection(QIBusCountryCode e) {
    if (widget.onChanged != null) {
      widget.onChanged(e);
    }
  }

  void _onInit(QIBusCountryCode initialData) {
    if (widget.onInit != null) {
      widget.onInit(initialData);
    }
  }
}
