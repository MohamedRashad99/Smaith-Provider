import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final Color color;
  bool isLoading = false;
  CustomButton({@required this.onPressed,@required this.title, this.color,this.isLoading});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical:5,horizontal: 30),
      height: MediaQuery.of(context).size.height /14,
      width: MediaQuery.of(context).size.width / 1.2,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isLoading!=true?Text(title,style: TextStyle(
              color:Colors.white,
              fontFamily: "dinnextl bold",
              fontSize:18,),)
                :SpinKitChasingDots(
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
        color: color==null? kPrimaryColor:color,
        onPressed: onPressed,
        elevation: 3,
      ),
    );
  }
}
