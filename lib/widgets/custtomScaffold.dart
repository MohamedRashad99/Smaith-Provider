import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;


   CustomScaffold({ this.body}) ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor:Colors.transparent,
          body:Column(
            children: [
              Container(
                height:100,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(180),
                    bottomLeft: Radius.circular(180),
                  ),
                ),
              ),
            ],
          ),

    );
  }
}
