import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smith_resturant/Screens/ChooseService/pages.dart';
import 'package:smith_resturant/Screens/SignIn/view.dart';
import 'package:smith_resturant/Screens/sign_up/provider.dart';
import 'package:smith_resturant/constants.dart';

class SplashScrren extends StatefulWidget {
  @override
  _SplashScrrenState createState() => _SplashScrrenState();
}

class _SplashScrrenState extends State<SplashScrren> {
  getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final String token = preferences.getString("token");
    print(" Token = \t $token ");
    if (token == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SignInView(),
        ),
      );
    } else {
      var provider = Provider.of<SignUpProvider>(context, listen: false);
      provider.setToken(token);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavBar(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 3),
      () => getToken(),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
          height: height * 0.3,
          child: Image.asset("assets/images/loogo.PNG"),
        ),
      ),
    );
  }
}
