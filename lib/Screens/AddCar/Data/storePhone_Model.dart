// class StorePhoneModel {
//   String msg;
//   int code;
//   Data data;
//
//   StorePhoneModel({this.msg, this.code, this.data});
//
//   StorePhoneModel.fromJson(Map<String, dynamic> json) {
//     msg = json['msg'];
//     code = json['code'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['msg'] = this.msg;
//     data['code'] = this.code;
//     if (this.data != null) {
//       data['data'] = this.data.toJson();
//     }
//     return data;
//   }
// }
//
// class Data {
//   String phone;
//   int code;
//   String type;
//   String carNumber;
//   String apiToken;
//   String updatedAt;
//   String createdAt;
//   int id;
//
//   Data(
//       {this.phone,
//         this.code,
//         this.type,
//         this.carNumber,
//         this.apiToken,
//         this.updatedAt,
//         this.createdAt,
//         this.id});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     phone = json['phone'];
//     code = json['code'];
//     type = json['type'];
//     carNumber = json['car_number'];
//     apiToken = json['api_token'];
//     updatedAt = json['updated_at'];
//     createdAt = json['created_at'];
//     id = json['id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['phone'] = this.phone;
//     data['code'] = this.code;
//     data['type'] = this.type;
//     data['car_number'] = this.carNumber;
//     data['api_token'] = this.apiToken;
//     data['updated_at'] = this.updatedAt;
//     data['created_at'] = this.createdAt;
//     data['id'] = this.id;
//     return data;
//   }
// }
