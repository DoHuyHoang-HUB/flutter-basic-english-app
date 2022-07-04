import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_english_app/config/routes/routes.dart';
import 'package:flutter_english_app/config/routes/routes_name.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: Routes.login_page,
        onGenerateRoute: RouteName.generateRoute,
      ),
      designSize: const Size(414, 896),
      minTextAdapt: true,
    );
  }
}
