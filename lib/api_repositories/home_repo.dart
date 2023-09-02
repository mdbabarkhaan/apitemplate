import 'dart:convert';

import 'package:apitemplate/api_modals/postmodel.dart';
import 'package:apitemplate/api_modals/reqresmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:apitemplate/api_modals/airline_modal.dart';
import 'package:apitemplate/api_services/api_response.dart';
import 'package:apitemplate/api_services/api_services.dart';
import 'package:apitemplate/api_services/handling_response.dart';
import 'package:apitemplate/constants/app_api_paths.dart';
import 'package:apitemplate/resources/app_data.dart';

class HomeRepo {
  final ApiServices _apiServices = ApiServices();

  Future<ApiResponse> getUser(String id) async {
    try {
      Response res = await _apiServices.get('${AppApiPaths.passengers}?page=0&size=10');
      ApiResponse result = HandlingResponse.returnResponse(res);
      print('REPO : ' + result.status.toString());
      if (result.status == Status.completed) {
        AirlineModal data = AirlineModal.fromJson(json.decode(res.body));
        return ApiResponse.completed(data);
      } else {
        return result;
      }
    } catch (w) {
      return HandlingResponse.returnException(w);
    }
  }

  Future<ApiResponse> getPosts(String id) async {
    try {
      Response res = await _apiServices.get(AppApiPaths.post);
      ApiResponse result = HandlingResponse.returnResponse(res);
      print('REPO : ' + result.status.toString());
      if (result.status == Status.completed) {
        List<PlaceHolderModel> data = List.from(json.decode(res.body)?.map((e) => PlaceHolderModel.fromJson(e)) ??[]);
        print('dddddddddddddddd');
        print(data.length);
        return ApiResponse.completed(data);
      } else {
        return result;
      }
    } catch (w) {
      return HandlingResponse.returnException(w);
    }
  }
  Future<ApiResponse> getReqRes(String id) async {
    try {
      Response res = await _apiServices.get(AppApiPaths.users);
      // print(res.body);
      ApiResponse result = HandlingResponse.returnResponse(res);
      print('REPO : ' + result.status.toString());
      if (result.status == Status.completed) {
        // List<PlaceHolderModel> data = List.from(
        //     json.decode(res.body)?.map((e) => PlaceHolderModel.fromJson(e)) ??
        //         []);
        ReqResmodel data = ReqResmodel.fromJson(jsonDecode(res.body));
        print('dddddddddddddddd');
        // print(data.length);
        return ApiResponse.completed(data);
      } else {
        return result;
      }
    } catch (w) {
      return HandlingResponse.returnException(w);
    }
  }
}
