// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:smith/Screens/ChooseService/pages.dart';
// import 'package:smith/Screens/sign_up/provider.dart';
// import 'package:smith/generated/locale_keys.g.dart';
// import 'package:smith/network/network.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:smith/global.dart' as globals;
//
// import '../../../constants.dart';
//
// class SignInController {
//   Future SignIn({context, var num, var pass}) async {
//     var provider = Provider.of<SignUpProvider>(context, listen: false);

//     savePref(String token) async {
//       SharedPreferences preferences = await SharedPreferences.getInstance();
//       preferences.setString("token", token);
//       print(preferences.getString("token"));
//     }

//     Map<String, dynamic> _body = {
//       "phone": "+966${num}",
//       "password": "${pass}",
//     };
//     var formData = FormData.fromMap(_body);
//     var response = NetWork.post(
//       'login',
//       body: formData,
//     );
//     final msg = value['msg'] as String;
//     response.then((value) {
//       //print(value.data['data'].toString());
//       print(value['msg'].toString());
//       /* globals.uid=value['data']['id'];
//       print("UerID : ${globals.uid}");
// */
//       if (msg == 'success') {
//         // savePref("${value['data']['api_token']}");

//         Navigator.of(context).push(
//           MaterialPageRoute(builder: (context) => BottomNavBar()),
//         );
//       } else if (value['data'] == 'check your phone or password') {
//         print("erfgegfe${value}");
//         Fluttertoast.showToast(
//             msg: "${LocaleKeys.incorrectCredentials.tr()}",
//             toastLength: Toast.LENGTH_LONG,
//             gravity: ToastGravity.BOTTOM,
//             timeInSecForIosWeb: 1,
//             backgroundColor: kPrimaryColor,
//             textColor: Colors.white,
//             fontSize: 16.0);
//       }
//     });

//     return response;
 // }
//}
