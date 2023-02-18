import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../models/user_models/user_model.dart';

class RestClient {
  Future<List<dynamic>> users() async {
    List<dynamic>? users;
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com',
      ),
    );

    try {
      Response userData = await dio.get('/users');
      users = userData.data.map((user) => User.fromJson(user)).toList();
      debugPrint('Users List: $users');
    } on DioError catch (e) {
      parseDioError(e);
    }
    return users!;
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
