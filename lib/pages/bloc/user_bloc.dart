import 'package:first/data/datasource/remote_data.dart';
import 'package:first/data/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final RemoteUser remoteUser;
  UserBloc({required this.remoteUser}) : super(UserInitial()) {
    on<LoadUser>((event, emit) async {
      emit(UserLoading());
      try {
        final result = await remoteUser.getUsers();
        emit(UserLoaded(result.data));
      } catch (error) {
        emit(UserError(error.toString()));
      }
    });
  }
}
