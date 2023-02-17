import '../../../data/models/user_models/user_model.dart';

class UserState {}

class UserInitialState extends UserState {}

class UserLoading extends UserState {}

class UserLoadedState extends UserState {
  List<User> data;
  UserLoadedState(this.data);
}

class UserError extends UserState {
  Error e;
  UserError(this.e);
}
