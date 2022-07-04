import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_english_app/config/routes/routes.dart';
import 'package:flutter_english_app/config/theme/app_colors.dart';
import 'package:flutter_english_app/page/user/widgets/heading_title.dart';
import 'package:flutter_english_app/page/user/widgets/password_field_input.dart';
import 'package:flutter_english_app/page/user/widgets/social_auth_button.dart';
import 'package:flutter_english_app/page/user/widgets/text_field_input.dart';
import 'package:flutter_english_app/services/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? errorMessage;

  Future<void> signUp(String email, String password) async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      try {
        await FirebaseAuthService.signUpWithEmailAndPassword(email, password)
            .then((value) => {
                  Fluttertoast.showToast(msg: "Account created successfully"),
                  Navigator.pushReplacementNamed(
                      context, Routes.dictionary_page),
                });
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
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
      }

      Fluttertoast.showToast(msg: errorMessage!);
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
                    title: 'Register Account',
                    subTitle:
                        'Complete your details or continue \nwith social media',
                  ),
                  SizedBox(
                    height: 134.h,
                  ),
                  TextFieldInput(
                    hint: 'Enter your email',
                    prefixIcon: Image.asset('assets/images/user.png'),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  const PasswordFieldInput(
                    hint: 'Enter your password',
                  ),
                  SizedBox(
                    height: 70.h,
                  ),
                  // const AuthButton(textButton: 'Sign up', authentication: ,),
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
                        "Have an account? ",
                        style: TextStyle(
                          color: AppColors.hintTextColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Sign in',
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
