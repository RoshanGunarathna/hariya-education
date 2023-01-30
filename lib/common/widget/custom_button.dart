import 'package:flutter/material.dart';
import 'package:hariya_education_institute/themes/app_theme.dart';
import 'package:hariya_education_institute/themes/colors.dart';
import 'package:hariya_education_institute/custom_exception.dart';

class CustomButton extends StatelessWidget {
  final int language;
  final String text;
  final Function onpressed;
  const CustomButton(
      {super.key,
      required this.text,
      required this.onpressed,
      required this.language});

  @override
  Widget build(BuildContext context) {
    switch (language) {
      case 1:
        return ElevatedButton(
          onPressed: () => onpressed(),
          child: Text(
            text,
            style: TextStyle(
                fontFamily: AppTheme.headFont,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              minimumSize: const Size(double.infinity, 50)),
        );
      case 2:
        return ElevatedButton(
          onPressed: () => onpressed(),
          child: Text(text),
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              minimumSize: const Size(double.infinity, 50)),
        );
      default:
        throw CustomException(message: 'Language Argument value error');
    }
  }
}
