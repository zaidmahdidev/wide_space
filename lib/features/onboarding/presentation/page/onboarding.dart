import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/utils/constant/theme.dart';
import '../data/onboarding_model.dart';
import '../widgets/onboarding_footer.dart';
import '../widgets/onboarding_header.dart';



class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  var boardingcontroller = PageController();

  bool last = false;
  int x = 1;
  bool vis = false;


  @override
  Widget build(BuildContext context) {

    List<BoardingModel> boarding = [
      BoardingModel(
        image: 'assets/image/onboarding1.json',
        title: 'العلامات والنتائج',
        body: "يمكن الان من خلال هذا التطبيق من الحصول على العلامات والنتائج بكل سهولة.",
      ),
      BoardingModel(
        image: 'assets/image/onboarding2.json',
        title: "الاعلانات",
        body: "الان وبكل سهولة يمكن معرفة جميع الاعلانات والدورات الجديدة التي بدأت في الجامعه. ",
      ),
      BoardingModel(
        image: 'assets/image/onboarding3.json',
        title: "الاطلاع على المواد الدراسية",
        body: "يمكنك الان من الاطلاع على المواد الدراسية الخاصة بك، بما في ذلك جدول الدروس والمواد الدراسية والمصادر التعليمية المختلفة.",
      ),
    ];

    return Scaffold(
      
        body: Padding(
      padding: const EdgeInsets.only(top: 30 ,left: 20,right: 20,),
      child: Column(
        children: [
          OnbordingHeader(x: x),
          SizedBox(height: MediaQuery.of(context).size.height /7),
          Expanded(
            child: PageView.builder(
              controller: boardingcontroller,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildonbording(boarding[index]),
              itemCount: boarding.length,
              reverse: true,
              onPageChanged: (int index) {
                if (index == boarding.length - 1) {
                  setState(() {
                    x = 3;
                    last = true;
                  });
                } else {
                  setState(() {
                    x = boardingcontroller.page!.round() + 1;
                    last = false;
                  });
                }

                if (index >= 1) {
                  vis = true;
                } else {
                  vis = false;
                }
              },
            ),
          ),
          OnboardingFooter(last: last, boardingcontroller: boardingcontroller, vis: vis),
        ],
      ),
    ));
  }

  Widget buildonbording(BoardingModel model) => Column(

        children: [
          Lottie.asset(model.image , height: MediaQuery.of(context).size.height/2.5),
          Text(model.title, style: MyTheme.textStyle24),
          const SizedBox(
            height: 10.0,
          ),
          Text(model.body,
              style: MyTheme.textStyle14.copyWith(
                  color: const Color(0xFFA8A8A9),
                  height: 1.5), textAlign: TextAlign.center,),

        ],
      );
}











