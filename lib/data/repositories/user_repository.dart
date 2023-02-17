import 'package:providerexample/data/data_sources/api_service.dart';

import '../models/user_models/user_model.dart';

class UserRepository {
  static final UserRepository _singletonUserRepository =
      UserRepository._internal();

  factory UserRepository() {
    return _singletonUserRepository;
  }

  UserRepository._internal();
  RestClient restClient = RestClient();

  Future<List<User>?> getUsers() async {
    return await restClient.users();
  }
}
