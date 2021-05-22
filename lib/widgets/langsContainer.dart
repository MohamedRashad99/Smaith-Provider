import 'package:flutter/material.dart';

import '../constants.dart';

class LangContainer extends StatelessWidget {
  final String title;
  final String lang;
  final Function onTap;

  LangContainer({this.title, this.lang, this.onTap}) ;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return  GestureDetector(
      onTap:onTap ,
      child: Container(
        height: height*.18,
        width: height*.18,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(title, style: TextStyle(fontSize:32,fontWeight:FontWeight.bold,color:kPrimaryColor),),
            Text(lang, style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold,color:Colors.black),),
          ],
        ),
      ),
    );
  }
}
