import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService()
      : _dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com')) {
    // Adding interceptors
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('Request: ${options.method} ${options.path}');
          return handler.next(options); // Continue the request
        },
        onResponse: (response, handler) {
          print('Response: ${response.statusCode} ${response.data}');
          return handler.next(response); // Continue the response
        },
        onError: (DioError e, handler) {
          print('Error: ${e.message}');
          return handler.next(e); // Continue the error
        },
      ),
    );
  }

  Future<List<dynamic>> getUsers() async {
    final response = await _dio.get('/users');
    return response.data;
  }
}
