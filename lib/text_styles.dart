import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle title = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  );
  static TextStyle description = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
  );
  static TextStyle descriptionBold = description.copyWith(
    fontWeight: FontWeight.w700,
  );
}
