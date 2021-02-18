import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class HttpService {
  static final int statusCodeSuccess = 200;
  static HttpService _httpService = HttpService._();
  _HttpBaseClient _httpBaseClient;



  Future<http.Response> get(String url,String token) async {
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      HttpHeaders.authorizationHeader:"Bearer "+token
    };
    return await _httpBaseClient.get(url,headers: headers);
  }

  Future<http.Response> post(String url,Map<String, String> args,String token) async{
    final headers = {
    //  HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
     HttpHeaders.authorizationHeader:"Bearer "+token
    };
    print(url);
    print(token);
    return await _httpBaseClient.post(url, body: args,headers: headers);
  }

  Future<http.Response> put(String url,String args,String token) async{
    final headers = {
       HttpHeaders.contentTypeHeader: 'application/json',
    //  HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      HttpHeaders.authorizationHeader:"Bearer "+token
    };
    print(url);
    print(token);
    return await _httpBaseClient.put(url, body: args,headers: headers);
  }


  HttpService._() : _httpBaseClient = _HttpBaseClient(http.Client());
  static HttpService getInstance() => _httpService;


}


class _HttpBaseClient extends http.BaseClient{

  http.Client _httpClient;
  _HttpBaseClient(this._httpClient);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    //  request.headers[USER_AGENT_KEY] = USER_AGENT_VALUE;
    return _httpClient.send(request);
  }
}