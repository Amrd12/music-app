import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:musicapp/constans/api_constants.dart';

class ApiService {
  late Dio dio;

  final Map<String, String> _headers = {
    "x-rapidapi-host": dotenv.env["host"]!,
    "x-rapidapi-key": dotenv.env["apiKey"]!
  };

  ApiService() {
    BaseOptions options =
        BaseOptions(baseUrl: ApiConstantsRequest.baseUrl, headers: _headers);
    dio = Dio(options);
  }

  Future<Map<String, dynamic>> getResponseJson(String url,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      Response res = await dio.get(url, queryParameters: queryParameters);
      debugPrint("Status Code : ${res.statusCode.toString()}");
      if (res.data.runtimeType == String) {
        debugPrint("String Found");
        return res.data == "" ? {"error": "empty"} : jsonDecode(res.data);
      } else if (res.data.runtimeType == List) {
        return {"results": res.data};
      }
      return res.data;
    } catch (e) {
      debugPrint("api error : :  ${e.toString()}");
      return {"error": e.toString()};
    }
  }

  //return Map of the HomePage
  Future<Map<String, dynamic>> apiHomePage() async =>
      await getResponseJson(ApiConstantsRequest.home);
}
