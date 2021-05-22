import 'package:flutter/material.dart';

import '../constants.dart';

class LongText extends StatelessWidget {
  final String text;
  LongText({ this.text}) ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:30,vertical: 20),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          fontFamily: "dinnextl bold",
          color: kTextColor,
        ),
      ),
    );
  }
}
