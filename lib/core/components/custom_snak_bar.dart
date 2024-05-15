import 'package:flutter/material.dart';

class SnackbarManager {
  static bool isShowingSnackbar = false;

  static void showSnackbar(BuildContext context, String message, SnackbarStates state) {
    if (!isShowingSnackbar) {
      isShowingSnackbar = true;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: chooseSnackbarColor(state),
          elevation: 0,
          content: Text(
            message,
            style: TextStyle(color: Colors.white ,fontSize: 15),
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ).closed.then((_) {
        isShowingSnackbar = false;
      });
    }
  }
}



enum SnackbarStates { SUCCESS, ERROR, WARNING }

Color chooseSnackbarColor(SnackbarStates state) {
  Color color;

  switch (state) {
    case SnackbarStates.SUCCESS:
      color = Colors.green;
      break;
    case SnackbarStates.ERROR:
      color = Colors.red;
      break;
    case SnackbarStates.WARNING:
      color = Colors.amber;
      break;
  }

  return color;
}