import 'package:dio/dio.dart';
class ApiService {
  final String _basrUrl = 'https://www.googleapis.com/books/v1/';
  final Dio dio;
  ApiService(this.dio);
  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await dio.get('$_basrUrl$endpoint');
    return response.data;
  }
}
