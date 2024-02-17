part of 'aduan_bloc.dart';

@immutable
sealed class AduanState {}

final class AduanInitial extends AduanState {}

final class AduanLoading extends AduanState {}

final class AduanLoaded extends AduanState {
  final List<Aduan> aduans;
  AduanLoaded(this.aduans);
}

final class AduanError extends AduanState {
  final String error;
  AduanError(this.error);
}
