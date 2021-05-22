import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';


class MediaButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final String icon;
  final Color color;
  final Color textColor;
  MediaButton({@required this.onPressed,@required this.title, this.icon, this.color, this.textColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical:5,horizontal: 30),
      height: MediaQuery.of(context).size.height /15,
      width: MediaQuery.of(context).size.width / 1.2,
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: color,),

      child: RaisedButton(

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           SizedBox(
             height: 15,
               child: Image.asset(icon)),
            SizedBox(width: 3,),
            Text(title,style: TextStyle(
              color:textColor,
              fontWeight: FontWeight.bold,
              fontSize:17,),),
          ],
        ),
        color: Colors.white,
        onPressed: onPressed,
        elevation: 3,
      ),
    );
  }
}
