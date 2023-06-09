import 'package:CodeGenius/Online_Course/pages/sign_in/bloc/signin_blocs.dart';
import 'package:CodeGenius/Online_Course/pages/sign_in/bloc/signin_events.dart';
import 'package:CodeGenius/Online_Course/pages/sign_in/bloc/signin_states.dart';
import 'package:CodeGenius/Online_Course/pages/sign_in/signin_controller.dart';
import '../common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar("Log In"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildThirdPartyLogin(context),
                  Center(
                      child:
                          reusableText("Or use your email account to login")),
                  Container(
                    margin: EdgeInsets.only(top: 36.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("Email"),
                        SizedBox(
                          height: 5.h,
                        ),
                        buildTextField(
                            "Enter your email address", "email", "user",
                            (value) {
                          context.read<SignInBloc>().add(EmailEvent(value));
                        }),
                        SizedBox(
                          height: 5.h,
                        ),
                        reusableText("Password"),
                        buildTextField(
                            "Enter your password", "password", "lock", (value) {
                          context.read<SignInBloc>().add(PasswordEvent(value));
                        }),
                      ],
                    ),
                  ),
                  forgotPassword(),
                  SizedBox(
                    height: 70.h,
                  ),
                  buildLogInAndRegButton("Log in", "login", () {
                    SignInController(context: context).handleSignIn("email");
                  }),
                  buildLogInAndRegButton("Sign Up", "register", () {
                    Navigator.of(context).pushNamed("/register");
                  }),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
