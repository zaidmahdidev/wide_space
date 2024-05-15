import 'package:flutter/material.dart';
import 'package:student_portal_app/features/profile/presentation/page/widget/student_info.dart';
import '../../../../core/utils/constant/images.dart';
import '../../../../core/utils/constant/theme.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 190.0,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: Container(
                      height: 140.0,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            4.0,
                          ),
                          topRight: Radius.circular(
                            4.0,
                          ),
                        ),
                        image: DecorationImage(
                          image: AssetImage(
                            '${Images.banner2}',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 64.0,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: CircleAvatar(
                      radius: 60.0,
                      backgroundImage: AssetImage(
                        '${Images.logo}',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Text('زيد ثابت مهدي', style: MyTheme.textStyle20),
            const Text(
              '012054150050',
            ),
            const SizedBox(
              height: 20,
            ),
            const StudentInfo(
              name: 'اسم الطالب : ',
              info: 'زيد ثابت محمد محمد مهدي ',
            ),
            const StudentInfo(
              name: 'الرقم الاكاديمي  : ',
              info: '1205455004 ',
            ),
            const StudentInfo(
              name: 'تاريخ التسجيل : ',
              info: '22020-10-5 ',
            ),
            const StudentInfo(
              name: 'رقم الهوية : ',
              info: '01010112131 ',
            ),
            const StudentInfo(
              name: 'النوع : ',
              info: 'ذكر ',
            ),
            const StudentInfo(
              name: 'تاريخ الميلاد : ',
              info: '22020-10-5 ',
            ),const StudentInfo(
              name: 'مكان الميلاد : ',
              info: 'صنعاء  ',
            ),
            const StudentInfo(
              name: 'رقم الهاتف : ',
              info: '777777777',
            ),
            const StudentInfo(
              name: 'الكلية  : ',
              info: 'حاسوب',
            ),
            const StudentInfo(
              name: 'التخصص : ',
              info: 'تقنية معلومات ',
            ),

          ],
        ),
      ),
    );
  }
}

