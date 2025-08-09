//import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';

abstract class NetworkApiServices {
  Future<dynamic> postRequest({
    required String url,
    required Map<String, dynamic>? requestData,
    Map<String, String>? header,
    Map<String, dynamic>? queryParams,
    bool requireToken = true,
     Options? options,
  });

  Future<dynamic> getRequest(
      {required String url,
      Map<String, dynamic>? requestData,
      Map<String, String>? header,
        bool requireToken = true,
         Options? options,});


}


