import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: non_constant_identifier_names
Widget MainTitle(String title){
  return    Padding(
    padding: EdgeInsets.symmetric(vertical:5,horizontal: 20),
    child: Text(title,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontFamily: "dinnextl bold",
        color:Colors.black,
        fontSize:38,),),
  );
}