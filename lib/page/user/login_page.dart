import 'package:flutter/material.dart';
import 'package:flutter_english_app/config/theme/app_colors.dart';
import 'package:flutter_english_app/page/user/widgets/auth_button.dart';
import 'package:flutter_english_app/page/user/widgets/heading_title.dart';
import 'package:flutter_english_app/page/user/widgets/password_field_input.dart';
import 'package:flutter_english_app/page/user/widgets/social_auth_button.dart';
import 'package:flutter_english_app/page/user/widgets/text_field_input.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  const PasswordFieldInput(
                    hint: 'Enter your password',
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
                    height: 30.h,
                  ),
                  const AuthButton(textButton: 'Sign in'),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      SocialAuthButton(),
                      SocialAuthButton(),
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
