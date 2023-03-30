import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/model/user.dart';

abstract class UserBlocEvent {}

class GetUserEvent extends UserBlocEvent {
  String id;
  GetUserEvent(this.id);
}

class UserBloc extends Bloc<UserBlocEvent, User> {
  UserBloc() : super(UnitializedUser(0, "", "")) {
    on<GetUserEvent>((event, emit) async {
      try {
        User user = await User.getFromApi(event.id);
        emit(user);
      } catch (e) {
        //
      }
    });
  }
}
