import 'package:flutter/material.dart';

const List<Color> _colorThemes = [
  Colors.blue,
  Colors.red,
  Colors.yellowAccent
];

class AppTheme{
 final int selectedColor;
 final Brightness brightnessTheme;

  AppTheme({this.selectedColor=0,this.brightnessTheme = Brightness.light}):assert(selectedColor>=0 && selectedColor <=_colorThemes.length-1);

  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      brightness: brightnessTheme
    );
  }
}