import '../data_sources/api_service.dart';

class UserRepository {
  static final UserRepository _singletonUserRepository =
      UserRepository._internal();

  factory UserRepository() {
    return _singletonUserRepository;
  }

  UserRepository._internal();
  RestClient restClient = RestClient();

  Future getUsers() async {
    return await restClient.users();
  }
}
