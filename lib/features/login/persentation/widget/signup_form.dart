import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_portal_app/core/layout/layout.dart';
import 'package:student_portal_app/features/login/persentation/management/bloc/user_bloc.dart';
import 'package:student_portal_app/features/login/persentation/page/login.dart';

import '../../../../core/components/custom_button.dart';
import '../../../../core/components/custom_snak_bar.dart';
import '../../../../core/components/custom_text_form_field.dart';
import '../../../../core/utils/constant/theme.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  var userNameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      builder: (context, state) {
        if (state is SignUpSuccessDataState) {
          if (state.loginModel.status) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Layout(),
                ));
          }
        }
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
                  "انشاء حساب",
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
                        labelText: "الايميل",
                        prefixIcon: const Icon(Icons.email_outlined),
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                      ),
                      MyTextFormField(
                        borderRadius: 10,
                        labelText: "رقم الهاتف",
                        prefixIcon: const Icon(Icons.phone),
                        keyboardType: TextInputType.phone,
                        controller: phoneNumberController,
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
                              BlocProvider.of<UserBloc>(context).add(
                                  SignUpEvent(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      phonNumber: phoneNumberController.text,
                                      username: userNameController.text));
                              // LoginCubit.get(context).userSignUp(
                              //     username: userNameController.text,
                              //     email: emailController.text,
                              //     phonNumber: phoneNumberController.text,
                              //     password: passwordController.text);
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => Layout(),));
                            }
                          },
                          text: "انشاء حساب",
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
                                  builder: (context) => LoginScreen(),
                                ));
                          },
                          child: const Text('تسجيل الدخول')),
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
        if (state is SignUpErrorDataState) {
          SnackbarManager.showSnackbar(
              context, state.error, SnackbarStates.ERROR);
        }
      },
    );
  }
}
