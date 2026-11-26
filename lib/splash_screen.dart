
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_reusable_ui/dashboard.dart';
import 'package:flutter_reusable_ui/login.dart';
import 'package:flutter_reusable_ui/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  static const String loginKey = 'isLogin';
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3),()async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isLoggedIn = prefs.getBool(loginKey) ?? false ;

      Widget screen = Loginscreen();
      if(isLoggedIn){
        screen = Dashboard();
      }
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => screen,));

      });

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.cover,image: NetworkImage("https://www.shutterstock.com/image-photo/basket-fresh-fruit-assorted-flavors-260nw-2698157243.jpg"))
        ),
      ),
    );
  }
}
