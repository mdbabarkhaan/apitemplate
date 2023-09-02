import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:apitemplate/api_services/api_response.dart';

class HandlingResponse {
  static ApiResponse returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return ApiResponse.completed(response);
      case 400:
        return ApiResponse.error('Some Error Occured');
      case 401:
        return ApiResponse.unAuthorised('Un Authorized');
      case 403:
        return ApiResponse.error('Un Authorized');
      case 404:
        return ApiResponse.error('Un Authorized');
      case 500:
        return ApiResponse.error('Some Error Occured');
      default:
        return ApiResponse.error('Some Error Occured');
    }
  }

  static ApiResponse returnException(Object exception) {
    if (exception is SocketException) {
      return ApiResponse.noInternet('No Internet');
    } else if (exception is TimeoutException) {
      return ApiResponse.timeout('Timeout');
    } else {
      return ApiResponse.error('Some Error Occured');
    }
  }
}
