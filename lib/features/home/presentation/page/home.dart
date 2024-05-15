import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:student_portal_app/core/components/base_animationl_istview.dart';
import 'package:student_portal_app/core/utils/constant/images.dart';
import 'package:student_portal_app/core/utils/constant/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 3.2,
              child: const MyCarouselSlider(
                title: [
                  'استمر يا وحش  استمر يا وحش  استمر يا وحش  استمر يا وحش  استمر يا وحش ',
                  'استمر يا وحش  استمر يا وحش  استمر يا وحش  استمر يا وحش  استمر يا وحش ',
                  'استمر يا وحش  استمر يا وحش  استمر يا وحش  استمر يا وحش  استمر يا وحش ',
                  'استمر يا وحش  استمر يا وحش  استمر يا وحش  استمر يا وحش  استمر يا وحش ',
                  'استمر يا وحش  استمر يا وحش  استمر يا وحش  استمر يا وحش  استمر يا وحش ',
                  'استمر يا وحش  استمر يا وحش  استمر يا وحش  استمر يا وحش  استمر يا وحش ',
                ],
                imagePaths: [
                  Images.banner,
                  Images.banner2,
                  Images.banner3,
                  Images.banner,
                  Images.banner2,
                  Images.banner3
                ],
              ),
            ),


            Expanded(
                child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(80),
                  child: Image.asset(Images.logo),
                ),
                ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return BaseAnimationListView(
                      index: 0,
                      child: Card(
                        elevation: 2,
                        shadowColor: MyTheme.primaryColor,
                        child: ListTile(
                          leading: const CircleAvatar(child: Icon(Icons.local_library),),
                          title: const Text('الحاسوب '),
                          subtitle: Text('من أجمل التخصصات '),
                          trailing: Icon(Icons.arrow_forward_sharp),
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return SizedBox(
                                  height: MediaQuery.of(context).size.height / 1.5,
                                  child: ListView.builder(
                                    itemCount: 20,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                          child: BaseAnimationListView(
                                            index: 0,
                                            child: Card(
                                              elevation: 3,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: ListTile(
                                                title: const Text(
                                                  'تقنية معلومات',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                subtitle: const Text(
                                                  'وصف مختصر للتخصص',
                                                  textAlign: TextAlign.center,
                                                ),
                                                leading: const CircleAvatar(
                                                  // backgroundColor: Colors.blue,
                                                  child: Icon(
                                                    Icons.menu_book_sharp,
                                                    // color: Colors.white,
                                                  ),
                                                ),
                                                onTap: () {
                                                  // اتخذ إجراء عند النقر على التخصص
                                                },
                                              ),
                                            ),
                                          )
                                      );
                                    },
                                  ),
                                );
                              },
                            );

                          },
                        ),
                      ),
                    );
                  },
                ),

              ],
            ))
          ],
        ),
      ),
    );
  }
}

Widget slider({
  required final PageController controller,
  required int Count,
  required List<String> imagepath,
}) =>
    Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: controller,
            itemCount: Count,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    imagepath[index],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const CircleAvatar();
                    },
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 5),
        SmoothPageIndicator(
          count: Count,
          controller: controller,
          effect: const ExpandingDotsEffect(
            dotWidth: 10.0,
            dotHeight: 10.0,
            dotColor: Colors.grey,
            activeDotColor: MyTheme.primaryColor,
          ),
        ),
      ],
    );

class FFF extends StatefulWidget {
  const FFF({super.key});

  @override
  State<FFF> createState() => _FFFState();
}

class _FFFState extends State<FFF> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}






class MyCarouselSlider extends StatefulWidget {
  final List<String> imagePaths;
  final List<String> title;

  const MyCarouselSlider({super.key, required this.imagePaths, required this.title});

  @override
  _MyCarouselSliderState createState() => _MyCarouselSliderState();
}

class _MyCarouselSliderState extends State<MyCarouselSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.imagePaths.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      widget.imagePaths[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        return const CircleAvatar();
                      },
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      color: Colors.black.withOpacity(.5),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(widget.title[index]
                      ,style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),

                ],
              ),
            );
          },
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.imagePaths.length,
                (index) => GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = index;
                });
              },
              child: Container(
                width: 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? MyTheme.primaryColor : Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

