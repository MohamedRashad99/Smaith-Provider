import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import '../../generated/locale_keys.g.dart';
import '../../network/network.dart';
import '../ChooseService/pages.dart';

class SignInProvider extends ChangeNotifier{

  final formKeys = GlobalKey<FormState>();
  final namController = TextEditingController();
  final phController = TextEditingController();
  final passController = TextEditingController();
  final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  @override
  void dispose() {
    phController.dispose();
    passController.dispose();
    super.dispose();
  }

  Future<void> signIn(BuildContext context) async {
    if (formKeys.currentState.validate()) {
      try {
        _isLoading = true;
        notifyListeners();
        await _signInCall();
        Fluttertoast.showToast(
          msg: "${LocaleKeys.welcomeBack.tr()} :\t  ${namController.text.trim()}",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: kPrimaryColor,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavBar()));
      }catch (e) {
        Fluttertoast.showToast(
            msg: e.toString().tr(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: kPrimaryColor,
            textColor: Colors.white,
            fontSize: 16.0);
      } finally {
        _isLoading = false;
        notifyListeners();
      }
    }
  }

  void setToken(String token) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setString("token", token);
  }
  Future<void> _signInCall() async {
    final _body = <String, dynamic>{
      "phone": "+966${phController.text.trim()}",
      "password": passController.text.trim(),
    };
    final _formData = FormData.fromMap(_body);
    final response = await NetWork.post('login', body: _formData);
    final msg = response.data['msg'];
    if (msg == 'success') {
      setToken(response.data['data']['api_token']);
    } else if (msg == 'error' || response.data['data'] == '[The phone has already been taken.]') {
      throw LocaleKeys.phoneInvalid.tr();
    } else {
      throw msg;
    }
  }


}