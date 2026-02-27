part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoginSuccessState extends AuthState {}

final class AuthLoginLoadingState extends AuthState {}

final class AuthLoginErrorState extends AuthState {
  AuthLoginErrorState(this.error);
  final String error;
}
