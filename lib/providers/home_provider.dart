import 'package:flutter/cupertino.dart';
import 'package:apitemplate/api_repositories/home_repo.dart';
import 'package:apitemplate/api_services/api_response.dart';

class HomeProvider extends ChangeNotifier {

  final HomeRepo _homeRepo = HomeRepo();

  ApiResponse _response = ApiResponse.loading('message');
  ApiResponse _postresponse = ApiResponse.loading('message');
  ApiResponse _reqresresponse = ApiResponse.loading('message');

  ApiResponse get homeRes => _response;
  ApiResponse get postRes => _postresponse;
  ApiResponse get reqres => _reqresresponse;
  
  getAirline() async {
    _response = await _homeRepo.getUser('');
    notifyListeners();
    print('PROVIDERR : ' + _response.status.toString());
  }
   getPosts() async {
    _postresponse = await _homeRepo.getPosts('');
    notifyListeners();
    print('PROVIDERR : ' + _postresponse.status.toString());
  }
   getReq() async {
    _reqresresponse = await _homeRepo.getReqRes('');
    notifyListeners();
    print('PROVIDERR : ' + _reqresresponse.status.toString());
  }
}
