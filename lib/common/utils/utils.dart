import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../custom_exception.dart';
import '../../themes/app_theme.dart';

void showSnackBar(
    {required BuildContext context,
    required String content,
    required int language}) {
  switch (language) {
    case 1:
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            content,
            style: TextStyle(
              fontFamily: AppTheme.headFont,
              fontSize: 15,
            ),
          ),
        ),
      );
      break;
    case 2:
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            content,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      );
      break;
    default:
      CustomException(message: 'Language Argument value error');
  }
}

Future<File?> pickImageFromGallery(BuildContext context) async {
  File? image;
  try {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
  } catch (e) {
    showSnackBar(context: context, content: e.toString(), language: 2);
  }
  return image;
}
