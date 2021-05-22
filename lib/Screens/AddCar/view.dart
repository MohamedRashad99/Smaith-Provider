
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:smith_resturant/Screens/AddCar/Data/provider.dart';
import 'package:smith_resturant/Screens/Notification/view.dart';
import 'package:smith_resturant/Screens/SignIn/view.dart';
import 'package:smith_resturant/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:smith_resturant/generated/locale_keys.g.dart';

import 'package:smith_resturant/widgets/customButton.dart';
import 'package:smith_resturant/widgets/customTextFeild.dart';





class AddCar extends StatefulWidget {
  @override
  _AddCarState createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {


  final NotificationView notificationView = NotificationView();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddCarProvider>(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: buildAppBar(context),
      body: Form(
        key: provider.formKeysCar,
        child: SafeArea(

          child: SizedBox(
              height: height,
              width: width,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.1,
                    ),
                    Text(
                      LocaleKeys.addCar.tr(),
                      style: TextStyle(fontSize: 30, fontFamily: "dinnextl bold"),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Container(
                      height: height * 0.2,
                      child: Image.asset("assets/images/loogo.PNG"),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    CustomTextField(
                      label: true,
                      hint: LocaleKeys.enterPhone.tr(),
                      dIcon: Icons.phone_android,
                      controller: provider.phUserController,
                      type: TextInputType.phone,
                      valid: qValidator([
                        IsRequired(msg: LocaleKeys.enterPhone.tr()),
                        MinLength(5),
                      ]),
                    ),
                    CustomTextField(
                      hint: LocaleKeys.plateNumber.tr(),
                      dIcon: Icons.car_rental,
                      controller: provider.carIdController,
                      type: TextInputType.number,
                      valid: qValidator([
                        IsRequired(msg: LocaleKeys.plateNumber.tr()),
                        MinLength(5),
                      ]),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    CustomButton(
                      title: LocaleKeys.save.tr(),
                   /*   onPressed: (){
                        if(_formKey.currentState.validate()){
                          _setData();
                        }
                      },*/
                      onPressed: () => provider.addCar(context),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25))),
      leading: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInView()));            },
          child: Image.asset(
            "assets/images/arrow.jpeg",
            scale: 10,
          )),
      centerTitle: true,
      title: Text(
        LocaleKeys.addCar.tr(),
        style: TextStyle(
            fontSize: 22, color: kHomeColor, fontFamily: "dinnextl bold"),
      ),
    );
  }
}

