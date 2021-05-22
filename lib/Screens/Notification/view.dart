
import 'package:flutter/material.dart';
import 'package:smith_resturant/constants.dart';
import 'package:smith_resturant/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class NotificationView extends StatefulWidget {
  @override
  _NotificationViewState createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: buildAppBar(),
      body: Container(
          height: height,
          width: width,
          child: Center(
            child: Text(LocaleKeys.noNotification.tr(),style: TextStyle(fontFamily: "dinnextl bold",fontSize: 18),),
          )),
    );

  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25))),
     /* leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/images/arrow.jpeg",
            scale: 10,
          )),*/
      centerTitle: true,
      title: Text(
        LocaleKeys.notifications.tr(),
        style: TextStyle(
            fontSize: 22, color: kHomeColor, fontFamily: "dinnextl bold"),
      ),
    );
  }
}
