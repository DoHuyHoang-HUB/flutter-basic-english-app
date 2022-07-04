import 'package:flutter/material.dart';
import 'package:flutter_english_app/config/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialAuthButton extends StatelessWidget {
  const SocialAuthButton({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 55.sp,
        height: 55.sp,
        padding: EdgeInsets.all(12.r),
        decoration: const BoxDecoration(
          color: AppColors.borderLineColor,
          shape: BoxShape.circle,
        ),
        child: child,
      ),
    );
  }
}
