import 'package:flutter/material.dart';

import '../../../../core/utils/constant/theme.dart';
import '../../../login/persentation/page/login.dart';



class OnboardingFooter extends StatelessWidget {
  const OnboardingFooter({
    super.key,
    required this.last,
    required this.boardingcontroller,
    required this.vis,
  });

  final bool last;
  final PageController boardingcontroller;
  final bool vis;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
            onPressed: () {
              if (last) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginScreen()));
              } else {
                boardingcontroller.nextPage(
                    duration: Duration(milliseconds: 750),
                    curve: Curves.fastLinearToSlowEaseIn);
              }
            },
            child:  const Text(
              "التالي",
              style: TextStyle(color: MyTheme.primaryColor),
            )),

        TextButton(
          onPressed: () {
            boardingcontroller.previousPage(
              duration: const Duration(milliseconds: 750),
              curve: Curves.fastLinearToSlowEaseIn,
            );
          },
          child: Visibility(
              visible: vis,
              child:  const Text(
                "السابق",
                style: TextStyle(color: Colors.grey),
              )),
        ),

      ],
    );
  }
}