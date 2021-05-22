// class LoginModel {
//   String msg;
//   String apiToken;
//   Data data;
//
//   LoginModel({this.msg, this.apiToken, this.data});
//
//   LoginModel.fromJson(Map<String, dynamic> json) {
//     msg = json['msg'];
//     apiToken = json['api_token'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['msg'] = this.msg;
//     data['api_token'] = this.apiToken;
//     if (this.data != null) {
//       data['data'] = this.data.toJson();
//     }
//     return data;
//   }
// }
//
// class Data {
//   int id;
//   String name;
//   String phone;
//   Null code;
//   Null email;
//   String type;
//   Null emailVerifiedAt;
//   String apiToken;
//   Null googleToken;
//   Null carNumber;
//   String createdAt;
//   String updatedAt;
//
//   Data(
//       {this.id,
//         this.name,
//         this.phone,
//         this.code,
//         this.email,
//         this.type,
//         this.emailVerifiedAt,
//         this.apiToken,
//         this.googleToken,
//         this.carNumber,
//         this.createdAt,
//         this.updatedAt});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     phone = json['phone'];
//     code = json['code'];
//     email = json['email'];
//     type = json['type'];
//     emailVerifiedAt = json['email_verified_at'];
//     apiToken = json['api_token'];
//     googleToken = json['google_token'];
//     carNumber = json['car_number'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['phone'] = this.phone;
//     data['code'] = this.code;
//     data['email'] = this.email;
//     data['type'] = this.type;
//     data['email_verified_at'] = this.emailVerifiedAt;
//     data['api_token'] = this.apiToken;
//     data['google_token'] = this.googleToken;
//     data['car_number'] = this.carNumber;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
