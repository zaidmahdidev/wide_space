import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:student_portal_app/core/components/custom_button.dart';
import '../../../../core/components/custom_text_form_field.dart';
import '../widget/login_form.dart';
import '../widget/login_header.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var useNameController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? username, password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: LoginBody(formKey: formKey, autoValidateMode: autoValidateMode, useNameController: useNameController, passwordController: passwordController),
      ),
    );
  }
}



class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
    required this.formKey,
    required this.autoValidateMode,
    required this.useNameController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final AutovalidateMode autoValidateMode;
  final TextEditingController useNameController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).secondaryHeaderColor,
          ),
          child: Column(
            children: [
              const LoginHeader(),
              LoginForm(formKey: formKey, autoValidateMode: autoValidateMode, userNameController: useNameController, passwordController: passwordController),
            ],
          ),
        ),
      ],
    );
  }
}





