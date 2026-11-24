import 'package:flutter/cupertino.dart';
import 'package:flutter_reusable_ui/dashboard.dart';
import 'package:flutter_reusable_ui/login.dart';
import 'package:flutter_reusable_ui/main.dart';
import 'package:flutter_reusable_ui/register.dart';
import 'package:flutter_reusable_ui/splash_screen.dart';

class AppRoutes {
  static const homePath = '/';
  static const splash = '/splash';
  static const login = '/login';
  static const register = '/register';
  static const dashboard = '/dashboard';

  static Map<String, WidgetBuilder> paths = {
    homePath: (_) => MyHomePage(title: 'welcome'),
    splash : (_) => SplashScreen(),
    login: (_) => Loginscreen(),
    register : (_) => Register(),
    dashboard : (_) => Dashboard()
  };

}