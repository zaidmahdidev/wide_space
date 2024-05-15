import 'package:flutter/material.dart';
import 'package:student_portal_app/features/login/persentation/widget/signup_form.dart';

import '../widget/login_header.dart';


class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
        body: LoginBody(),
      ),
    );
  }
}



class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).secondaryHeaderColor,
          ),
          child: const Column(
            children: [
              LoginHeader(),
              SignUpForm(),
            ],
          ),
        ),
      ],
    );
  }
}
