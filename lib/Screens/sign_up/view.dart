import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:smith_resturant/Screens/SignIn/view.dart';
import 'package:smith_resturant/generated/locale_keys.g.dart';
import 'package:smith_resturant/widgets/customButton.dart';
import 'package:smith_resturant/widgets/customTextFeild.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:smith_resturant/widgets/donotHave.dart';
import '../../constants.dart';
import '../../widgets/componant.dart';
import 'provider.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO :: MATCH
    final provider = Provider.of<SignUpProvider>(context);
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: provider.formKey,
        child: SafeArea(
          child: AnimatedContainer(
              duration: const Duration(seconds: 2),
              curve: Curves.decelerate,
              height: _size.height,
              width: _size.width,
              child: provider.isLoading
                  ? SpinKitChasingDots(
                size: 40,
                color: kPrimaryColor,
              ): SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: _size.height * 0.06),
                          Container(
                            width: _size.width * 0.4,
                            child: Image.asset("assets/images/loogo.PNG"),
                          ),
                          SizedBox(height: _size.height * 0.01),
                          Container(
                            padding: EdgeInsets.only(right: _size.width * 0.55),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  LocaleKeys.signup.tr(),
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontFamily: "dinnextl bold",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: _size.height * 0.04),
                          CustomTextField(
                            hint: LocaleKeys.userName.tr(),
                            dIcon: Icons.person,
                            controller: provider.nameController,
                            type: TextInputType.name,
                            valid: qValidator([
                              IsRequired(msg: LocaleKeys.userName.tr()),
                              MinLength(4,
                                  msg: context.locale == Locale('en', 'US')
                                      ? "Name must be content of two minimum words"
                                      : "يجب أن يتكون الاسم من كلمتين على الأقل")
                            ]),
                          ),
                          CustomTextField(
                            label: true,
                            hint: LocaleKeys.enterPhone.tr(),
                            dIcon: Icons.phone_android,
                            controller: provider.phoneController,
                            type: TextInputType.phone,
                            valid: qValidator([
                              IsRequired(msg: LocaleKeys.enterYourPhoneNum.tr()),
                              MinLength(9,
                                  msg: context.locale == Locale('en', 'US')
                                      ? "Phone number should be 9 numbers"
                                      : "لابد من ادخال رقم مكون من 9 ارقام"),
                              MaxLength(9,
                                  msg:
                                      context.locale == Locale('en', 'US') ? "Phone number should be 9 numbers" : "لابد من ادخال رقم مكون من 9 ارقام")
                            ]),
                          ),
                          CustomTextField(
                            hint: LocaleKeys.password.tr(),
                            icon: Icons.lock_outline,
                            dIcon: Icons.lock_outline,
                            controller: provider.passwordController,
                            valid: qValidator([
                              IsRequired(msg: LocaleKeys.password.tr()),
                            // Match(provider.confirmPasswordController.text,msg:"${ LocaleKeys.passConfirmationInvalid.tr()}",),
                              MinLength(5),
                            ]),
                          ),
                          CustomTextField(
                            hint: LocaleKeys.confirmPass.tr(),
                            icon: Icons.lock_outline,
                            dIcon: Icons.lock_outline,
                            controller: provider.confirmPasswordController,
                            type: TextInputType.text,
                            valid: qValidator([
                              IsRequired(msg: LocaleKeys.confirmPass.tr()),
                             // Match(provider.passwordController.text,msg:"${ LocaleKeys.passConfirmationInvalid.tr()}"),
                              MinLength(5),
                            ]),
                          ),
                          SizedBox(height: _size.height * 0.02),
                          CustomButton(
                            title: LocaleKeys.signup.tr(),
                            onPressed: () => provider.signUp(context),
                          ),
                          DoNotHave(
                            text: LocaleKeys.signIn.tr(),
                            have: LocaleKeys.alreadyHaveAnAccount.tr(),
                            route: () => navigateTo(context, SignInView()),
                          ),
                          SizedBox(height: _size.height * 0.1),
                        ],
                      ),
                    )),
        ),
      ),
    );
  }
}
