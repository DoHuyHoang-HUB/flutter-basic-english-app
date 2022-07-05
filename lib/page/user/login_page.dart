import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_english_app/config/routes/routes.dart';
import 'package:flutter_english_app/config/theme/app_colors.dart';
import 'package:flutter_english_app/page/user/widgets/auth_button.dart';
import 'package:flutter_english_app/page/user/widgets/heading_title.dart';
import 'package:flutter_english_app/page/user/widgets/password_field_input.dart';
import 'package:flutter_english_app/page/user/widgets/social_auth_button.dart';
import 'package:flutter_english_app/page/user/widgets/text_field_input.dart';
import 'package:flutter_english_app/services/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? errorMessage;

  Future<void> signIn(String email, String password) async {
    print("login");
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      try {
        await FirebaseAuthService.signIn(email, password).then((value) => {
              Navigator.pushReplacementNamed(
                context,
                Routes.dictionary_page,
              )
            });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
      }
    }
  }

  void loginWithGoogle(BuildContext context) {
    FirebaseAuthService.signInWithGoogle().then((value) {
      Navigator.pushNamed(context, Routes.dictionary_page);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(top: 50.h, left: 24.w, right: 24.w),
              child: Column(
                children: [
                  const HeadingTitle(
                    title: 'Welcome back',
                    subTitle:
                        'Sign in with your email and password\n or continue with social media',
                  ),
                  SizedBox(
                    height: 134.h,
                  ),
                  TextFieldInput(
                    hint: 'Enter your email',
                    prefixIcon: Image.asset('assets/images/user.png'),
                    controller: _emailController,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  PasswordFieldInput(
                    hint: 'Enter your password',
                    controller: _passwordController,
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'Forgot password',
                      style: TextStyle(
                        color: AppColors.hintTextColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: AuthButton(
                      textButton: 'Sign in',
                      authentication: signIn(
                        _emailController.text,
                        _passwordController.text,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 90.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialAuthButton(
                        child: Image.asset('assets/images/google.png'),
                        onTap: () => loginWithGoogle(context),
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      SocialAuthButton(
                        child: Image.asset('assets/images/phone.png'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Dont't have an account? ",
                        style: TextStyle(
                          color: AppColors.hintTextColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.register_page);
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            color: AppColors.primaryBuleColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
