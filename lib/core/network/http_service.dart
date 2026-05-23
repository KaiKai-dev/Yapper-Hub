import 'package:dio/dio.dart';


class HttpService {
  HttpService._();
  static final instance = HttpService._();

  late final Dio _client;

  void init() { 
    final baseOptions = BaseOptions(
      baseUrl: "http://192.168.1.220/",
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
    }catch (e) {
      throw UnimplementedError("$e" );
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