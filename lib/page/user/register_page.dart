import 'package:flutter/material.dart';
import 'package:flutter_english_app/config/routes/routes.dart';
import 'package:flutter_english_app/config/theme/app_colors.dart';
import 'package:flutter_english_app/page/user/widgets/auth_button.dart';
import 'package:flutter_english_app/page/user/widgets/heading_title.dart';
import 'package:flutter_english_app/page/user/widgets/password_field_input.dart';
import 'package:flutter_english_app/page/user/widgets/social_auth_button.dart';
import 'package:flutter_english_app/page/user/widgets/text_field_input.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                  const AuthButton(textButton: 'Sign up'),
                  SizedBox(
                    height: 90.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialAuthButton(
                        child: Image.asset('assets/images/google.png'),
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
