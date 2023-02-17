import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:providerexample/data/models/user_models/user_model.dart';

class RestClient {
  Future<List<User>?> users() async {
    List<User>? users;
    final Dio _dio = Dio(
      BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com',
      ),
    );

    try {
      Response userData = await _dio.get('/users');

      debugPrint('User Info: ${userData.data}');

      users = User.fromJson(userData.data) as List<User>?;
    } on DioError catch (e) {
      parseDioError(e);
    }
    return users;
  }

  void parseDioError(DioError e) {
    if (e.response != null) {
      debugPrint('Dio error!');
      debugPrint('STATUS: ${e.response?.statusCode}');
      debugPrint('DATA: ${e.response?.data}');
      debugPrint('HEADERS: ${e.response?.headers}');
    } else {
      // Error due to setting up or sending the request
      debugPrint('Error sending request!');
      debugPrint(e.message);
    }
  }
}
