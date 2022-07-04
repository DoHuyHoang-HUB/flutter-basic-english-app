import 'package:flutter/material.dart';
import 'package:flutter_english_app/config/theme/app_colors.dart';
import 'package:flutter_english_app/config/theme/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadingTitle extends StatelessWidget {
  const HeadingTitle({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyles.h1,
          textAlign: TextAlign.center,
        ),
        Text(
          subTitle,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
            color: AppColors.hintTextColor,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
