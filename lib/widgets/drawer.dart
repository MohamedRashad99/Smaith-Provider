import 'package:flutter/material.dart';
import 'package:smith_resturant/constants.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:smith_resturant/generated/locale_keys.g.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int selectedIndex = 0;
  List<Widget> listWidgets = [
/*    Wallet(),
    ContactWithAdministration(),
    Settings(),*/
  ];
  List<IconData> listIcons = [
    Icons.account_balance_wallet_outlined,
    Icons.contact_phone_outlined,
    Icons.settings
  ];
  List<String> listTitles = [
/*    LocaleKeys.wallet.tr(),
    LocaleKeys.contactWithAdmin.tr(),
    LocaleKeys.settings.tr()*/
  ];

/*
  deliveryBalanceModel _deliveryBalanceModel=deliveryBalanceModel();
  deliveryBalanceController _deliveryBalanceController = deliveryBalanceController();*/

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(

            color: kBackgroundColor,
            height: height * 0.25,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                      child: GestureDetector(
                        onTap: (){
                         /* Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PersonalInfo()),);*/
                        },
                        child: CircleAvatar(
                          maxRadius: 25,
                          child: Icon(Icons.camera_alt_outlined,) ,
                        ),
                      ),
                    ),
                    Text(
                      LocaleKeys.ahmedAlmorsehdy.tr(),
                      style: TextStyle(
                          color: Colors.black, fontFamily: 'dinnextl bold',fontSize: 18),
                    ),
                  ],
                ),
                Container(
                  height: height * 0.07,
                  width: width * 0.7,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                  color: kHomeColor,
                  borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SizedBox(width:width*0.06, ),
                      Icon(Icons.whatshot),
                      Text(
                        LocaleKeys.rewards.tr(),
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'dinnextl medium'),
                      ),
                      SizedBox(width:width*0.2, ),
                      Text(
                      LocaleKeys.point.tr(),
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'dinnextl medium'),
                        ),
                      Icon(Icons.arrow_right_rounded),
                    ],
                  ),
                ),
              ],
            ),
          ),
        //  Divider(),
          Container(
            color: kHomeColor,
            height: height * 0.5,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  color: kHomeColor,
                  height: height * 0.50,
                  child: Column(
                    children: [
                    //  buildFlatButton(context:context,width: width*0.03,icon:Icons.account_balance_wallet_outlined,name:  LocaleKeys.wallet.tr(),route: Wallet() ),
                   //   buildFlatButton(context:context,width: width*0.03,icon:Icons.contact_phone_outlined,name:  LocaleKeys.contactWithAdmin.tr() ,route: ContactWithAdministration()),
                    //  buildFlatButton(context:context,width: width*0.03,icon:Icons.settings,name:  LocaleKeys.settings.tr() ,route: Settings()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        // Divider(),

      Container(
        color: kBackgroundColor,
        height: height * 0.25,
        width: width,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                LocaleKeys.share.tr(),
                style: TextStyle(
                    color: Colors.black, fontFamily: 'dinnextl bold',fontSize: 15),
              ),
            ),
            SizedBox(height: height*0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Image.asset('assets/images/share.png'),
                SizedBox(width:width*0.03, ),
                Image.asset('assets/images/facebook.png'),
                SizedBox(width:width*0.03, ),
                Image.asset('assets/images/twitter.png'),
                SizedBox(width:width*0.03, ),
                Image.asset('assets/images/inista.png'),


              ],
            ),
          ],
        ),
      ),
        ],
      ),
    );
  }

  FlatButton buildFlatButton({BuildContext context, double width,IconData icon , String name ,Widget route}) {
    return FlatButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => route),);

                      },

                      child: Row(
                        children: [
                          Icon(icon),
                          SizedBox(width: width,),
                          Text(
                            name,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'dinnextl medium',fontSize: 16),
                          ),
                        ],
                      ),
                    );
  }
}
