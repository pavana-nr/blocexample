import 'package:dio/dio.dart';
import 'package:providerexample/data/models/user_models/user_model.dart';
import 'package:retrofit/retrofit.dart';

part "api_service.g.dart";

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  @GET("/users")
  Future<List<User>> getUsers();
}
