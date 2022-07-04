import 'package:flutter/material.dart';
import 'package:flutter_english_app/config/routes/routes.dart';
import 'package:flutter_english_app/page/dictionary/dictionary_page.dart';
import 'package:flutter_english_app/page/user/login_page.dart';
import 'package:flutter_english_app/page/user/register_page.dart';

class RouteName {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login_page:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case Routes.register_page:
        return MaterialPageRoute(builder: (context) => const RegisterPage());
      case Routes.dictionary_page:
        return MaterialPageRoute(builder: (context) => const DictionaryPage());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
