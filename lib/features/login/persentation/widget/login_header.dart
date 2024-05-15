import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';



class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Lottie.asset(
          'assets/image/loginn.json',
          fit: BoxFit.fill),
    );
  }
}