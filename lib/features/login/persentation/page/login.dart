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
          child: Column(
            children: [
              const LoginHeader(),
              LoginForm(),
            ],
          ),
        ),
      ],
    );
  }
}





