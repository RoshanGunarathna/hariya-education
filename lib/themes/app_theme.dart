import 'package:flutter/material.dart';
import 'package:hariya_education_institute/themes/colors.dart';

class AppTheme {
  static sinhalaTextStyle(BuildContext context) {
    return new TextStyle(
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Anurada',
    );
  }

  static InputBorder focusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(
          left: Radius.circular(20), right: Radius.circular(20)),
      borderSide: BorderSide(
        width: 5,
        color: primaryColor,
      ),
    );
  }

  static InputBorder enabledBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(20), right: Radius.circular(20)),
        borderSide: BorderSide(
          width: 3,
          color: primaryColor,
        ));
  }

  static const String headFont = 'Vecrashmi'; //'Anurada';
  static const String secondFont = 'Anurada';
}
