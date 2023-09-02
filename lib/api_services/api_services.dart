import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:apitemplate/resources/app_data.dart';

import '../resources/app_data.dart';

class ApiServices {
  static const imageUrl = 'https://oengoo.aptechmedia.com/';
  static const baseurl = "https://reqres.in/api/";
  // static const baseurl = 'https://jsonplaceholder.typicode.com/';
  static const url = "https://jsonplaceholder.typicode.com/";


  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': ''
    // 'Authorization': 'Bearer 3|LxcCdpF1fIl0lnu9bFq37AIXfU8wCgyoBpZfAcNh'
  };

  String get _token => 'Bearer ${AppData.instance.token ?? ''}';
  Future<http.Response> post(String path, Map<String, String> body) async {
    headers['Authorization'] = _token;
    String wholeUrl = baseurl + path;
    var request = http.MultipartRequest('POST', Uri.parse(wholeUrl));
    request.fields.addAll(body);
    request.headers.addAll(headers);
    http.StreamedResponse streamResponse = await request.send();
    http.Response response = await http.Response.fromStream(streamResponse);
    return response;
  }

  Future<http.Response> postMulti(String path, Map<String, String> body,{bool isFile = false, String? filePath}) async {
    headers['Authorization'] = _token;

    String wholeUrl = baseurl + path;
    var request = http.MultipartRequest('POST', Uri.parse(wholeUrl));
    List<FileInfo> filelist = [FileInfo(fileKey: '', filepath: '')];

    postMultifile("path", body: {}, files: filelist);
    request.fields.addAll(body);
    if (isFile) {
      request.files.add(await http.MultipartFile.fromPath('profile_pic', '$filePath'));
    }
    request.headers.addAll(headers);
    http.StreamedResponse streamResponse = await request.send();
    http.Response response = await http.Response.fromStream(streamResponse);
    return response;
  }

  Future<http.Response> postMultifile(String path, {Map<String, String> body = const {}, List<FileInfo> files = const []}) async {
    headers['Authorization'] = _token;
    String wholeUrl = baseurl + path;
    var request = http.MultipartRequest('POST', Uri.parse(wholeUrl));
    request.fields.addAll(body);
    for (var file in files) {
      request.files.add(await http.MultipartFile.fromPath(file.fileKey, file.filepath));
    }
    request.headers.addAll(headers);
    http.StreamedResponse streamResponse = await request.send();
    http.Response response = await http.Response.fromStream(streamResponse);
    return response;
  }

  Future<MultipartFile> fileAdding(String key, String path) async {
    return await http.MultipartFile.fromPath(key, path);
  }

  Future<http.Response> get(String path) async {
    headers['Authorization'] = _token;
    (headers);
    String wholeUrl = baseurl + path;
    print(wholeUrl);

    var request = http.Request('GET', Uri.parse(wholeUrl));
    request.headers.addAll(headers);
    http.StreamedResponse streamResponse = await request.send();
    http.Response response = await http.Response.fromStream(streamResponse);
    print(response.body);
    print(response.statusCode);
    return response;
  }
}

class FileInfo {
  final String filepath;
  final String fileKey;
  FileInfo({required this.fileKey, required this.filepath});
}
