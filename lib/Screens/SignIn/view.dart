import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:smith_resturant/Screens/SignIn/provider.dart';
import 'package:smith_resturant/Screens/sign_up/provider.dart';
import 'package:smith_resturant/Screens/sign_up/view.dart';
import 'package:smith_resturant/constants.dart';
import 'package:smith_resturant/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:smith_resturant/widgets/componant.dart';
import 'package:smith_resturant/widgets/customButton.dart';
import 'package:smith_resturant/widgets/customTextFeild.dart';
import 'package:smith_resturant/widgets/donotHave.dart';

class SignInView extends StatefulWidget {
  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignInProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Form(
        key: provider.formKeys,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SafeArea(
          child: SizedBox(
              height: height,
              width: width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.1,
                    ),
                    Container(
                      width: width * 0.4,
                      child: Image.asset("assets/images/loogo.PNG"),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Container(
                      padding: EdgeInsets.only(right: width * 0.4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(LocaleKeys.welcome.tr(),
                              style: TextStyle(
                                fontSize: 28,
                                fontFamily: "dinnextl bold",
                              )),
                          Text(LocaleKeys.signToContinue.tr(), style: TextStyle(fontSize: 20, fontFamily: "dinnextl bold", color: kTextColor)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.06,
                    ),
                    CustomTextField(
                      label: true,
                      hint: LocaleKeys.enterPhone.tr(),
                      dIcon: Icons.phone_android,
                      type: TextInputType.phone,
                      valid: qValidator([
                        IsRequired(msg: LocaleKeys.enterPhone.tr()),
                        MinLength(5),
                      ]),
                      controller: provider.phController,
                    ),
                    CustomTextField(
                      hint: LocaleKeys.password.tr(),
                      icon: Icons.lock_outline,
                      dIcon: Icons.lock_outline,
                      type: TextInputType.text,
                      valid: qValidator([
                        IsRequired(msg: LocaleKeys.password.tr()),
                        MinLength(5),
                      ]),
                      controller: provider.passController,
                    ),
                    SizedBox(
                      height: height * 0.1,
                    ),
                    CustomButton(
                      onPressed: () => provider.signIn(context),
                      title: LocaleKeys.signIn.tr(),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    DoNotHave(
                      text: LocaleKeys.signup.tr(),
                      have: LocaleKeys.donHave.tr(),
                      route: () => navigateTo(context, SignUpScreen()),
                    ),
                    SizedBox(
                      height: height * 0.06,
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
