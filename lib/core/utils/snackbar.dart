import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_theme.dart';

class SnackBarMessage {
  static void showSuccessMessage(
      {required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppTheme.textTheme.labelMedium!.copyWith(color: Colors.white),
        ),
        backgroundColor:
            Get.isDarkMode ? AppTheme.darkSuccessColor : AppTheme.successColor,
      ),
    );
  }

  static void showErrorMessage(
      {required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppTheme.textTheme.labelMedium!.copyWith(color: Colors.white),
        ),
        backgroundColor: AppTheme.errorColor,
      ),
    );
  }
}
