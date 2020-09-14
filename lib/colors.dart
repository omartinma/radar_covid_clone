import 'package:flutter/material.dart';

class AppColors {
  static Color customRed = Color.fromRGBO(224, 108, 87, 1);
  static Color disableImage = Colors.grey;
  static Color backgroundColor = Color.fromRGBO(250, 249, 247, 1);
  static ColorFilter greyScale = ColorFilter.matrix(<double>[
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
  ]);
}
