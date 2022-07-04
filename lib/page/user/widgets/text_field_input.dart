import 'package:flutter/material.dart';
import 'package:flutter_english_app/config/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldInput extends StatefulWidget {
  const TextFieldInput(
      {Key? key, required this.hint, this.prefixIcon, this.controller})
      : super(key: key);

  final Widget? prefixIcon;
  final String hint;
  final TextEditingController? controller;

  @override
  State<TextFieldInput> createState() => _TextFieldInputState();
}

class _TextFieldInputState extends State<TextFieldInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: AppColors.borderLineColor,
        ),
      ),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.go,
        controller: widget.controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 27.w,
            vertical: 26.h,
          ),
          prefixIcon: widget.prefixIcon,
          hintText: widget.hint,
          hintStyle: TextStyle(
            color: AppColors.hintTextColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
