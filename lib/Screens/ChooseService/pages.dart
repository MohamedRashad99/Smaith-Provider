import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:smith_resturant/Screens/AddCar/view.dart';
import 'package:smith_resturant/Screens/Notification/view.dart';
import 'package:smith_resturant/constants.dart';
import 'package:smith_resturant/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:smith_resturant/widgets/smallButton.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  final NotificationView notificationView = NotificationView();
  final AddCar addCar = AddCar();

  final _pageOptions = [NotificationView(),AddCar()];


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: pageIndex,
            height: 50.0,
            items: <Widget>[
              Icon(Icons.notifications, size: 30),
              Icon(Icons.add, size: 30),

            ],
            color: Colors.white,
            buttonBackgroundColor: Colors.white,
            backgroundColor: Colors.black,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 600),
            onTap: (tappedIndex) {
              setState(() {
                pageIndex = tappedIndex;
              });
            },
            letIndexChange: (index) => true,
          ),
          body: _pageOptions[pageIndex]),
    );

  }

  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(LocaleKeys.doYouWantLogOut.tr(),
          style: TextStyle(fontSize: 20, color: kPrimaryColor, fontFamily: "dinnextl bold"),),
        content: Text(LocaleKeys.pleaseMake.tr(),
          style: TextStyle(fontSize: 10, color: kPrimaryColor,),),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmallButton(onPressed:() => Navigator.of(context).pop(false),
                  title: LocaleKeys.no.tr()),
              SizedBox(width: 40,),
              SmallButton(onPressed: () => exit(0),
                  title: LocaleKeys.yes.tr()),
            ],
          ),

        ],
      ),
    ) ??
        false;
  }
}