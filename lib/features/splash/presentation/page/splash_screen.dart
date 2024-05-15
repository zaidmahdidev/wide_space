// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:flutter/material.dart';
//
// import '../../../core/utils/constant/images.dart';
// import '../../../core/utils/constant/theme.dart';
// import '../../onboarding/presentation/page/onboarding.dart';
//
//
// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key });
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return Scaffold(
//
//         body: AnimatedSplashScreen(
//            backgroundColor: Theme.of(context).primaryColor,
//       splash:  Container(
//
//         margin: const EdgeInsets.symmetric(horizontal: 30 , vertical: 10),
//
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children:  [
//             Spacer(),
//             Padding(
//               padding: const EdgeInsets.all(30),
//               child:  Image(image: AssetImage(Images.logo )  ,fit: BoxFit.fill,
//                 // color: Colors.white,
//                 color: Theme.of(context).secondaryHeaderColor,
//               ),
//             ),
//              Spacer(),
//              Text('إعـداد \nوحدة نظم المعلومات قطاع الاستثمار \nاللجنة الزراعيه العليا ' , style: MyTheme.textStyle15.copyWith(height: 1.5 ), textAlign: TextAlign.center  ) ,
//           ],
//         ),
//       ),
//       splashIconSize: MediaQuery.of(context).size.height ,
//       // nextScreen: Splash_Screen(),
//       nextScreen: OnBoarding()
//     ));
//   }
// }
//




import 'dart:async';
import 'package:flutter/material.dart';
import 'package:student_portal_app/core/utils/constant/images.dart';
import 'package:student_portal_app/features/onboarding/presentation/page/onboarding.dart';
import 'package:student_portal_app/features/splash/presentation/widegets/splash_body.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
  const SplashScreen({super.key});
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  late AnimationController animationController;
  late Animation<double> animation;

  startTime() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) =>
            OnBoarding()
    ));
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: new Duration(seconds: 4));
    animation =
    CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }


  @override
  Widget build(BuildContext context) {
    return  SplashBody( animation: animation);
  }
}