import 'package:flutter/material.dart';

const Color _customColor = Color(0XFF5C11D4);

const List<Color> _colorTheme = [
  _customColor,
  Colors.black,
  Colors.blue,
  Colors.pink,
  Colors.yellow,
  Colors.white,
  Colors.green,
  Colors.teal
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= _colorTheme.length - 1,
            'Color mush be between 0 and ${_colorTheme.length}');

  ThemeData theme() {
    return ThemeData(
        colorSchemeSeed: _colorTheme[selectedColor], useMaterial3: true);
  }
}
