import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_portal_app/core/components/custom_snak_bar.dart';
import 'package:student_portal_app/core/utils/constant/theme.dart';
import 'package:student_portal_app/features/home/presentation/page/home.dart';
import 'package:student_portal_app/features/login/persentation/management/login_cubit.dart';
import 'package:student_portal_app/features/login/persentation/management/login_state.dart';
import 'package:student_portal_app/features/splash/presentation/page/splash_screen.dart';

import '../../../../core/components/custom_button.dart';
import '../../../../core/components/custom_text_form_field.dart';
import '../../../../core/layout/layout.dart';
import '../../../../core/utils/common_utils.dart';


class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.formKey,
    required this.autoValidateMode,
    required this.userNameController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final AutovalidateMode autoValidateMode;
  final TextEditingController userNameController;
  final TextEditingController passwordController;

 
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginState>(builder: (context, state) {
      if(state is LoginLoadingDataState){
        return Center(child: CircularProgressIndicator(),);
      }

      return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "تسجيل الدخول" , style: MyTheme.textStyle20,),
              const SizedBox(height: 40),
              Form(
                key: formKey,
                autovalidateMode: autoValidateMode,
                child: Column(
                  children: [

                    MyTextFormField(
                      outlineFocusedBorderColor: Colors.cyan,
                      borderRadius: 10,
                      labelText: "الرقم الاكاديمي",
                      prefixIcon: const Icon(Icons.person),
                      controller: userNameController,
                    ),

                    MyTextFormField(
                      borderRadius: 10,
                      labelText: "كلمة السر",
                      prefixIcon: const Icon(Icons.lock),
                      controller: passwordController,
                    ),


                    // CustomTextFormAuth(
                    //   hinttext: "ادخل الرقم الاكاديمي",
                    //   isNumber: false,
                    //   borderRadius: 10,
                    //   labeltext:"الرقم الاكاديمي",
                    //   mycontroller: useNameController,
                    //   obscureText: false,
                    //   prefixIcon: Icons.person,
                    //   valid: (val) {
                    //     if (val?.isEmpty == true) {
                    //       return "الحقل متطلب";
                    //     }
                    //     return null;
                    //   },
                    // ),
                    // const SizedBox(height: 15),
                    // CustomTextFormAuth(
                    //   hinttext: "ادخل كلمة السر",
                    //   isNumber: false,
                    //   labeltext: "كلمة السر",
                    //   borderRadius: 10,
                    //   mycontroller: passwordController,
                    //   prefixIcon: Icons.lock_outline,
                    //   // obscureText: LoginCubit.get(context).obscureText,
                    //   // iconData: LoginCubit.get(context).suffix,
                    //   onTapIcon: () {
                    //
                    //   },
                    //   valid: (val) {
                    //     if (val?.isEmpty == true) {
                    //       return "الحقل مطلوب";
                    //     }
                    //     return null;
                    //   },
                    // ),
                    const SizedBox(height: 40),
                    customButton(fun: (){
                      if(formKey.currentState!.validate()){

                        LoginCubit.get(context).userLogin(username: userNameController.text, password: passwordController.text);
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => Layout(),));
                      }
                    },text: "تسجيل الدخول",radius: 10,),

                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }, listener: (context, state) {
      if(state is LoginErrorDataState){
        SnackbarManager.showSnackbar(context, state.error, SnackbarStates.ERROR);
      }
    },);
  }
}