
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_portal_app/core/components/custom_snak_bar.dart';
import 'package:student_portal_app/core/utils/constant/theme.dart';
import 'package:student_portal_app/features/home/presentation/page/home.dart';
import 'package:student_portal_app/features/login/persentation/management/bloc/user_bloc.dart';
import 'package:student_portal_app/features/login/persentation/page/signup.dart';
import 'package:student_portal_app/features/splash/presentation/page/splash_screen.dart';

import '../../../../core/components/custom_button.dart';
import '../../../../core/components/custom_text_form_field.dart';
import '../../../../core/layout/layout.dart';
import '../../../../core/utils/common_utils.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<UserBloc>(context),
      child: BlocConsumer<UserBloc, UserState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "تسجيل الدخول",
                    style: MyTheme.textStyle20,
                  ),
                  const SizedBox(height: 20),
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
                        const SizedBox(height: 40),
                        ConditionalBuilder(
                          condition: state is! LoginLoadingDataState,
                          builder: (context) => customButton(
                            fun: () {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<UserBloc>(context).add(LoginEvent(
                                    email: userNameController.text,
                                    password: passwordController.text));
                              }
                            },
                            text: "تسجيل الدخول",
                            radius: 10,
                          ),
                          fallback: (context) => Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUpScreen(),
                                  ));
                            },
                            child: Text('انشاء حساب')),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is LoginErrorDataState) {
            SnackbarManager.showSnackbar(
                context, state.error, SnackbarStates.ERROR);
          }
        },
      ),
    );
  }
}
