// ignore_for_file: unused_import

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> GetData({
    required String url,
    required Map<String,dynamic> query,
  }) async{
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }
}
