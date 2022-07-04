import 'package:flutter/material.dart';
import 'package:flutter_english_app/config/routes/routes.dart';
import 'package:flutter_english_app/config/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({Key? key, required this.textButton}) : super(key: key);

  final String textButton;

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.dictionary_page);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 21.h),
        width: mediaQuery.width,
        decoration: BoxDecoration(
          color: AppColors.primaryBuleColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Text(
            textButton,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}