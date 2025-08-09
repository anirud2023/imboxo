import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:untitled/data/datasources/local/app_local_data_impl.dart';
import 'package:untitled/data/datasources/remote/remote/api_exception.dart';
import 'package:untitled/data/datasources/remote/remote/network_api_services.dart';
import 'package:untitled/data/datasources/remote/remote/responseHandler/api_response.dart';
import 'package:untitled/res/app_strings.dart';


import 'responseHandler/status.dart';

class NetworkApiServicesImpl extends NetworkApiServices {
  AppLocalDataImpl storage = AppLocalDataImpl();
  late final Dio _dio;

  NetworkApiServicesImpl() {
    _dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ));

     _dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }



  @override
  Future<Resource> getRequest({
    required String url,
    Map<String, dynamic>? requestData,
    Map<String, String>? header,
    bool requireToken = true,
     Options? options,
  }) async {
    try {

      String? token = requireToken ? storage.getUserToken() : null;
      // Set Headers
      _dio.options.headers = _generateHeaders();


      var response = await _dio.get(
        options: options,
        url,
        queryParameters: requestData,
      );


      return handleResponse(response);
    } catch (exception) {
      return handleExceptions(exception);
    }
  }


  @override
  Future<Resource> postRequest({
    required String url,
    required Map<String, dynamic>? requestData,
    Map<String, String>? header,
    Map<String, dynamic>? queryParams,
    bool requireToken = false,
     Options? options,
  }) async {

    try {
       String? token = requireToken ? storage.getUserToken() : null;

      // Set Headers
      _dio.options.headers = _generateHeaders();

      var response = await _dio.post(
        url,
        options: options,
        data: requestData != null ? jsonEncode(requestData) : null,
      );


      return handleResponse(response);

    } catch (exception) {

      return handleExceptions(exception);

    }
  }

  Resource handleResponse(Response response) {
    if (response.data != null) {
      return Resource(
          status: STATUS.SUCCESS,
          data: response.data,
          message: (response.data is String) ? response.data : (response.data is List) ? "" : response.data['message'] ?? "");
    } else {
      return Resource(status: STATUS.SUCCESS, data: "", message: "");
    }
  }

  Resource handleExceptions(dynamic exception) {
    try {
      switch (exception) {
        case DioException _:
          final ApiException apiException = ApiException.fromDioError(exception);
          return Resource(
              status: STATUS.ERROR, message: apiException.toString());
        case SocketException _:
        // return Resource(status: STATUS.ERROR, message: 'No Internet');
          return Resource(status: STATUS.SUCCESS, message: 'No Internet');
        case Exception _:
          return Resource(
              status: STATUS.ERROR, message: 'Something went wrong');

        default:
          return handleStatusCode(exception);
      }
    } catch (e) {
      return Resource(status: STATUS.ERROR, message: AppStrings.apiException);
    }
  }

  Resource handleStatusCode(dynamic dioError) {
    var message = AppStrings.failedRequest;
      if (dioError.response!.statusCode! < 500) {
        switch (dioError.response!.statusCode) {
          case 400:
            message = handleError(dioError.response!.data);
            break;

          case 401:
            message = handleError(dioError.response!.data);
            break;

          case 404:
            message = handleError(dioError.response!.data);
            break;

          default:
            message = dioError.response!.statusMessage ?? message;
        }
      }


    return Resource(status: STATUS.ERROR, message: message);
  }

  String handleError(String? serverMessage) {
    var message = AppStrings.failedRequest;
    if (serverMessage == null) return message;
    return message;
  }


  Map<String, String> _generateHeaders() {

    return {
      'Content-Type': 'application/json',
    };
  }

}
