import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smith_resturant/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:smith_resturant/network/network.dart';

import '../../../constants.dart';

class AddCarProvider extends ChangeNotifier{

  final formKeysCar = GlobalKey<FormState>();
  final carIdController = TextEditingController();
  final phUserController = TextEditingController();
  final passUserController = TextEditingController();
  final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  @override
  void dispose() {
    phUserController.dispose();
    carIdController.dispose();
    super.dispose();
  }


  Future<void> addCar(BuildContext context) async {
    if (formKeysCar.currentState.validate()) {
      try {
        _isLoading = true;
        notifyListeners();
        await _addCarCall();
        Fluttertoast.showToast(
          msg: "${LocaleKeys.addCar.tr()} :\t  ${carIdController.text.trim()}",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: kPrimaryColor,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      //  Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavBar()));
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
  Future<void> _addCarCall() async {
    final _body = <String, dynamic>{
      "phone": "+966${phUserController.text.trim()}",
      "car_number": carIdController.text.trim(),
    };

    final preferences = await SharedPreferences.getInstance();

    final _formData = FormData.fromMap(_body);
    final response = await NetWork.post('storephone', body: _formData,
        headers: {
        // "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer ${preferences.getString("token")}"}
    );
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