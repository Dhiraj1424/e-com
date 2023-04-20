import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:e_commerce_advance/services/network/base_network.dart';

import '../app_exception.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getAll(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  @override
  Future getProductById(String url) async {
    dynamic responses;
    try {
      final response = await http.get(Uri.parse(url));
      responses = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responses;
  }

  @override
  Future postAll(String url, data) {
    throw UnimplementedError();
  }

  @override
  Future login(String url, data) async{
    dynamic responseJson;
    try {
       final response=await http.post(Uri.parse(url),
     headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
// Indicate request body is in JSON format

      body:jsonEncode({
      'username': data['username'],
          'password': data['password'],
    })
      ).timeout(const Duration(seconds: 30));
       responseJson=returnResponse(response);
    } on SocketException {
      throw 'No Internet Connection';
    }
return responseJson;
  }
}

dynamic returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var data = jsonDecode(response.body);
      return data;
    case 201:
      var data = jsonDecode(response.body);
      return data;
    case 500:
    case 400:
      throw BadRequestException(response.body.toString());
       case 401:
      throw UnAuthorizeException(response.body.toString());
    case 404:
      throw UnAuthorizeException('iiiiiii+${response.body}');
    default:
      throw FetchDataException(
          'Error occurred while communicating with server' +
              'with status code' +
              response.statusCode.toString());
  }
}
