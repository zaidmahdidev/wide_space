import 'package:flutter/material.dart';
import '../../../../core/utils/constant/images.dart';




class SplashBody extends StatefulWidget {
  final  Animation<double> animation;
  const SplashBody({super.key, required this.animation});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child:  Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Spacer(),
                Image.asset(
                  Images.logo,
                  width: widget.animation.value * 350,
                  height: widget.animation.value * 350,
                ),
                const Spacer(),

                // Text('إعداد' , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold), textAlign: TextAlign.center  ) ,

              ],
            ),
          ],
        ),
      ),
    );
  }
}
