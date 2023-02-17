import 'package:providerexample/data/models/user_models/user_model.dart';

abstract class UserEvent {
  const UserEvent();
}

class FetchUserEvent extends UserEvent {
  FetchUserEvent();
}
