import 'package:flutter/material.dart';
import 'package:flutter_english_app/config/routes/routes.dart';
import 'package:flutter_english_app/config/theme/app_colors.dart';
import 'package:flutter_english_app/config/theme/app_text_styles.dart';
import 'package:flutter_english_app/page/dictionary/widgets/content_widget.dart';
import 'package:flutter_english_app/page/dictionary/widgets/drawer_widget.dart';
import 'package:flutter_english_app/page/dictionary/widgets/search_input.dart';
import 'package:flutter_english_app/services/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DictionaryPage extends StatefulWidget {
  const DictionaryPage({Key? key}) : super(key: key);

  @override
  State<DictionaryPage> createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {
  var sreachedText = "community";

  void logout() async {
    await FirebaseAuthService.signOut().then((value) {
      Navigator.pushReplacementNamed(context, Routes.login_page);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    DateTime _lastExitTime = DateTime.now();
    return Scaffold(
      drawer: DrawerWidget(email: FirebaseAuthService.getCurrentUser()!.email!),
      appBar: AppBar(
        backgroundColor: AppColors.primaryBuleColor,
        title: const Text(
          'Dictionary',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: mediaQuery.height,
          width: mediaQuery.width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 27.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 28.h,
                ),
                SearchInput(
                  onSubmit: (text) {
                    setState(() {
                      sreachedText = text;
                    });
                  },
                ),
                SizedBox(
                  height: 27.h,
                ),
                Row(
                  children: [
                    Container(
                      width: 55.sp,
                      height: 55.sp,
                      decoration: const BoxDecoration(
                        color: AppColors.borderLineColor,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset('assets/images/volume-2.png'),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'School',
                          style: AppTextStyles.h1,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          '/skool',
                          style: TextStyle(
                            color: AppColors.hintTextColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 38.h,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Content();
                    },
                    itemCount: 3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
