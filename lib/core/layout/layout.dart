import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:student_portal_app/core/utils/constant/images.dart';
import 'package:student_portal_app/features/home/management/home/home_cubit.dart';
import 'package:student_portal_app/features/profile/presentation/page/profile.dart';

import '../../features/home/management/home/home_state.dart';
import '../../features/home/presentation/page/home.dart';
import '../utils/constant/theme.dart';


class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  var _currentIndex = 0;
  List<Widget> screen =[
    HomeScreen(),
    ProfileScreen(),
    FFF(),
    FFF(),
    ProfileScreen(),
  ];
  List<String> title = [
    "الرئيسية",
    "النين ",
    "نتنلب",
    "الملف الشخصي",
    "الملف الشخصي",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer:  Drawer(
        child: Column(
          children: [

            BlocBuilder<HomeCubit,HomeState>(builder: (context, state) {
              return Stack(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration:  BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                        ),
                        color: Theme.of(context).secondaryHeaderColor
                    ),
                    child: Image.asset(Images.logo ,height: 150,)
                  ),
                  Positioned(
                    child:  IconButton(onPressed: (){
                      HomeCubit.get(context).changMode();
                    },  icon: HomeCubit.get(context).isDark ? Icon(Icons.light_mode , color: Colors.white ,size: 30,):Icon(Icons.dark_mode , color: Colors.white ,size: 30,)
                    ),
                  ),
                ],
              );
            },),
            ListTile(
              onTap: (){},
              title: Text('المقررات'),
            ),
            ListTile(
              onTap: (){},
              title: Text('عن الجامعة'),
            ),ListTile(
              onTap: (){},
              title: Text('تغيير كلمة السر'),
            ),
            ListTile(
              onTap: (){},
              title: Text('حول التطبيق '),
            ),
            const Spacer(),
            const Text('اصدار التطبيق 1.0.2'),
            const SizedBox(height: 5,),
          ],
        ),
      ),
      appBar: AppBar(title: Text(
        title[_currentIndex]
      ),
      centerTitle: true,
      ),
      body: screen[_currentIndex],

      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) { setState(() => _currentIndex = i);
        },
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("الرئيسية"),
            selectedColor: Colors.purple,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: const Icon(Icons.gradient),
            title: const Text("النتائج"),
            selectedColor: Colors.pink,
          ),
          /// Likes
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Likes"),
            selectedColor: Colors.pink,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Search"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: const Icon(Icons.person_2_outlined),
            title: const Text("الملف الشخصي"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
