import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants.dart';

class SmallButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final Color color;
  bool isLoading = false;
  var loadingColor;
  SmallButton({@required this.onPressed,@required this.title, this.color,this.isLoading,this.loadingColor});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(vertical:5,horizontal: 10),
        height: MediaQuery.of(context).size.height /15,
        width: MediaQuery.of(context).size.width /4,
        decoration: BoxDecoration(
          color:color==null?Colors.white:kPrimaryColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color:kPrimaryColor,width: 1.5)
        ),
        child:  Center(
          child: Padding(
                padding:  EdgeInsets.only(bottom: 8),
                child: isLoading!=true?Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  fontFamily: "dinnextl bold",
                  color:color==null?kPrimaryColor:Colors.white,
                  fontSize:18,),)
                    :SpinKitChasingDots(
                  size: 20,
                  color: loadingColor==null?Colors.white:loadingColor,
                ),
              ),
        ),
      ),
    );
  }
}
