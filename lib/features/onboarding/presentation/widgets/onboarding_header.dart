import 'package:flutter/material.dart';

import '../../../login/persentation/page/login.dart';




class OnbordingHeader extends StatelessWidget {
  const OnbordingHeader({
    super.key,
    required this.x,
  });

  final int x;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton.icon(
            icon: const Icon(Icons.arrow_back_outlined),
            label:  const Text(
              "تخطي",
            ),
            onPressed: (){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) =>  LoginScreen()));
            }),
        Text(
          '$x/3',
          style: const TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}