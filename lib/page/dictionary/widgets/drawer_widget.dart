import 'package:flutter/material.dart';
import 'package:flutter_english_app/config/routes/routes.dart';
import 'package:flutter_english_app/config/theme/app_colors.dart';
import 'package:flutter_english_app/services/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key, required this.email}) : super(key: key);

  final String email;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Image.asset('assets/images/gdsc.png'),
          ),
          Text(
            email,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Divider(
            thickness: 0.7,
            color: Colors.black12,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 21.w,
              vertical: 21.h,
            ),
            child: InkWell(
              onTap: () async {
                await FirebaseAuthService.signOut().then((value) {
                  Navigator.popAndPushNamed(context, Routes.login_page);
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 21.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primaryBuleColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: Text(
                    "Sign out",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
