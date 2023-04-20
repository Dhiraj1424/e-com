// class TokenModel {
//   // String? token;

//   // UserModel({this.token});

//   // UserModel.fromJson(Map<String, dynamic> json) {
//   //   token = json['token'];

//   // }


//   String? token;
//   TokenModel({this.token});

//   factory TokenModel.fromJson(Map<String, dynamic> json){
//         final  token=json['token'];

//     return TokenModel(
//       token: token
//     );
//   }


//     Map<String, dynamic> toJson() {
//     return{
//       'token':token
//     };
//   }
// }

class TokenModel {
  String? token;

  TokenModel({this.token});

  TokenModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;

    return data;
  }
}