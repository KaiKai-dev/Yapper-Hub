import 'dart:developer';

import 'package:chat_app/core/env/env.dart';
import 'package:chat_app/core/network/api_endpoints.dart';
import 'package:dio/dio.dart';


class HttpService {
  HttpService._();
  static final instance = HttpService._();

  late final Dio _client;

  void init() { 
    final baseOptions = BaseOptions(
      baseUrl: Env.apiUrl,
      connectTimeout: Duration(seconds: 20),
        
    );
    _client = Dio(baseOptions);
  }


  Future<T> post<T>(
    String route, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    String? bearer,
  }) async {
    
    try {
      final options = Options(
        headers: _buildHeader(bearerToken: bearer, options: headers),
      );

      final result = await _client.post(route, data: data, options: options);
// 
      // if(result.statusCode == 200){
        return result.data as T;
      // }
    } on DioException catch(e) {
      //Todo implement DioException handling
      throw UnimplementedError("DioException: ${e.message}");
    } catch (e) {
      log(e.toString());
      throw UnimplementedError("$e" );
    }
  } 

  Future<T?> get<T>(
    String route, {
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queries,
      Map<String, dynamic>? data,
      String? bearer,
  }) async {
    try {
      final options = Options(
        headers: _buildHeader(
          bearerToken: bearer,
        ),
      );
      
      

      final result = await _client.get(
        route,
        queryParameters: queries,
        data: data,
        options: options,
      );

      if(result.statusCode == 200) {
        return result.data;
      } else {  
        throw DioException(requestOptions: RequestOptions(
          path: route, 
          data: data, 
          baseUrl: _client.options.baseUrl
        ));
      }
    } catch (e) {
      // TODO: add an exception wrapper for all exceptions
      log(e as String);
    }
  }

  Map<String, dynamic> _buildHeader({
    Map<String, dynamic>? options,
    String? bearerToken
  }) {
    final Map<String, dynamic> returnData = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'x-access-key': 'Yapper-Access-Key-1217',

      if(bearerToken != null) 'Authorization': 'Bearer: $bearerToken'
    };

    if(options != null) returnData.addAll(options);

    return returnData;
  } 
}