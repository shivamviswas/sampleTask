import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sample_task/services/service_http.dart';


class API {
  static HttpService _httpService = HttpService.getInstance();



  static String weatherApi = "http://api.openweathermap.org/data/2.5/weather?";



  static Future<Response> post(String api,Map<String, String> args,String token) {
    print(token.toString());
    print(api.toString());
    print(args.toString());
    return _httpService.post(api,args,token);
  }

  static Future<Response> get(String api,String token) {
    print(token.toString());
    print(api.toString());
    return _httpService.get(api,token);
  }

  static Future<Response> put(String api,Map<String, dynamic> args,String token) {
    print(token.toString());
    print(api.toString());
    print(args.toString());
    return _httpService.put(api,json.encode(args),token);
  }

  // static Future<dio.Response> uploadSingleFile(
  //     String token, String filePath, String path) async {
  //   dio.FormData formData = dio.FormData.fromMap({
  //     "isMultiple": false,
  //     "path": "blog/gallery",
  //     "files":
  //     await dio.MultipartFile.fromFile(filePath, filename: filePath.split('/').last),
  //   });
  //   return dio.Dio().post(singalFileUpload,
  //       data: formData,
  //       options: dio.Options(headers: {
  //         HttpHeaders.contentTypeHeader: "multipart/form-data",
  //         HttpHeaders.authorizationHeader: "Bearer " + token,
  //       }));
  // }


}
