import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/user_models/user_model.dart';
import '../../../data/repositories/user_repository.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository = UserRepository();

  UserState get initialState {
    return UserInitialState();
  }

  UserBloc() : super(UserInitialState()) {
    on<UserEvent>((event, emit) async {
      emit(UserLoading());
      try {
        List<dynamic> userList = await _userRepository.getUsers();
        emit(UserLoadedState(userList.cast<User>()));
        debugPrint(userList.length.toString());
      } catch (e) {
        debugPrint("error msg ${e.toString()}");
        emit(UserError(Error()));
      }
    });
  }
}
