import 'package:first/data/model/aduan.dart';
import 'package:first/data/datasource/remote_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'aduan_event.dart';
part 'aduan_state.dart';

class AduanBloc extends Bloc<AduanEvent, AduanState> {
  final RemoteAduan remoteAduan;
  AduanBloc({required this.remoteAduan}) : super(AduanInitial()) {
    on<LoadAduan>((event, emit) async {
      emit(AduanLoading());
      try {
        final result = await remoteAduan.getAduan();
        emit(AduanLoaded(result.data));
      } catch (error) {
        emit(AduanError(error.toString()));
      }
    });
  }
}
