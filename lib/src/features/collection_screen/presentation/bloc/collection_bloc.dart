import 'dart:async';

import '../../../../../main_export.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserUseCase _userUseCase = sl.get();
  UserBloc() : super(UserInitialState()) {
    on<GetUsers>(_getUserData);
    on<ToggleUserLike>(_toggleUserLike);
  }

  Future<void> _getUserData(GetUsers event, emit) async {
    debugPrint("event is $event");
    emit(UserLoading());
    final result = await _userUseCase(MessageParams(data: {}));
    debugPrint("event is $event");
    result.fold((failure) {
      debugPrint("error is ${(failure.message)}");
      emit(ErrorInLoading());
    }, (users) {
      // debugPrint("users are ${users.users.first.toJson()}");
      emit(UserFetched(user: users.users));
    });
  }

  FutureOr<void> _toggleUserLike(ToggleUserLike event, Emitter<UserState> emit) {
    final currentState = state;
    if (currentState is UserFetched) {
      final updatedUsers = List<User>.from(currentState.user);
      final oldUser = updatedUsers[event.index];
      final updatedUser = oldUser.copyWith(completed: !(oldUser.completed??false));
      updatedUsers[event.index] = updatedUser;
      emit(UserFetched(user: updatedUsers));
    }
  }
}
