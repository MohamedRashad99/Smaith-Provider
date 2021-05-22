import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget main_text(String txt,double sz,var cr,TextAlign textAlign){




  return Text(txt,textAlign: textAlign,style: TextStyle(
  fontFamily: "Cairo-Bold",fontSize: sz,color: Color(cr),
  ));
}