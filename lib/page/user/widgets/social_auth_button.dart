import 'package:flutter/material.dart';
import 'package:flutter_english_app/config/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialAuthButton extends StatelessWidget {
  const SocialAuthButton({Key? key, this.child, this.onTap}) : super(key: key);

  final Widget? child;

  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
