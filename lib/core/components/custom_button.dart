import 'package:flutter/material.dart';
import '../utils/constant/theme.dart';


Widget customButton({
  double width = double.infinity,
  Color background = MyTheme.primaryColor,
  bool isUpperCase = true,
  double radius = 3.0,
  required Function fun,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
      child: MaterialButton(
        onPressed: () {
          fun();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );