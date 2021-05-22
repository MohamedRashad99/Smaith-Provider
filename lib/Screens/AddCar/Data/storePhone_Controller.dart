// import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:smith/Screens/AddCar/Data/storePhone_Model.dart';
//
// import '../../../network/network.dart';
//
// class SphoneController {
//   StorePhoneModel _storePhoneModel = StorePhoneModel();
//
//   Future<StorePhoneModel> setPhoneData({String phone, String carNum}) async {
//     SharedPreferences _prefs = await SharedPreferences.getInstance();
//     print("تخزين الفون" + _prefs.getString("token"));
//     Map<String, dynamic> _body = {
//       "phone": phone,
//       "car_number": carNum,
//     };
//     FormData _formData = FormData.fromMap(_body);
//     var response = await NetWork.post('storephone',
//         body: _formData,
//         headers: {"Content-Type": "application/json", "Accept": "application/json", "Authorization": "Bearer ${_prefs.getString("token")}"});
//     print(response);
//     if (response != null) {
//       _storePhoneModel = StorePhoneModel.fromJson(response.data);
//       print(response);
//     } else {
//       _storePhoneModel = StorePhoneModel(msg: "success");
//     }
//     return _storePhoneModel;
//   }
// }
