import 'package:flutter/material.dart';
import 'package:flutter_english_app/config/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordFieldInput extends StatefulWidget {
  const PasswordFieldInput({Key? key, required this.hint}) : super(key: key);

  final String hint;

  @override
  State<PasswordFieldInput> createState() => _PasswordFieldInputState();
}

class _PasswordFieldInputState extends State<PasswordFieldInput> {
  bool isPasswordVisible = true;
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
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 27.w,
            vertical: 26.h,
          ),
          prefixIcon: Image.asset('assets/images/lock.png'),
          suffixIcon: isPasswordVisible
              ? InkWell(
                  onTap: () => visiblePassword(),
                  child: Image.asset('assets/images/eye.png'),
                )
              : InkWell(
                  onTap: () => visiblePassword(),
                  child: Image.asset('assets/images/eye-off.png'),
                ),
          hintText: widget.hint,
          hintStyle: TextStyle(
            color: AppColors.hintTextColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        obscureText: isPasswordVisible,
      ),
    );
  }

  void visiblePassword() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }
}
