
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_reusable_ui/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {

    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context,AppRoutes.login);
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
