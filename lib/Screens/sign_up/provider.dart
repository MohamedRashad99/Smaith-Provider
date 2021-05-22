import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../constants.dart';
import '../../generated/locale_keys.g.dart';
import '../../network/network.dart';
import '../ChooseService/pages.dart';

class SignUpProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> signUp(BuildContext context) async {
    if (formKey.currentState.validate()) {
      try {
        _isLoading = true;
        notifyListeners();
        await _signUpCall();
        Fluttertoast.showToast(
          msg: "${LocaleKeys.welcome.tr()} :\t  ${nameController.text.trim()}",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: kPrimaryColor,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavBar()));
      } catch (e) {
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

  Future<void> _signUpCall() async {
    final _body = <String, dynamic>{
      "phone": "+966${phoneController.text.trim()}",
      "name": nameController.text.trim(),
      "password": passwordController.text.trim(),
      "google_token": 'fcm_token',
    };
    final _formData = FormData.fromMap(_body);
    final response = await NetWork.post('register', body: _formData);
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
