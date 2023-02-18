import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:providerexample/data/repositories/user_repository.dart';
import 'package:providerexample/presentation/bloc/user_bloc/user_event.dart';
import 'package:providerexample/presentation/bloc/user_bloc/user_state.dart';

import '../../../data/models/user_models/user_model.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository = UserRepository();

  UserState get initialState {
    return UserInitialState();
  }

  UserBloc() : super(UserInitialState()) {
    on<UserEvent>((event, emit) async {
      emit(UserLoading());
      try {
        List<User> userList = await _userRepository.getUsers();
        emit(UserLoadedState(userList));
        debugPrint(userList.length.toString());
      } catch (e) {
        debugPrint("error msg ${e.toString()}");
        emit(UserError(Error()));
      }
    });
  }
}
