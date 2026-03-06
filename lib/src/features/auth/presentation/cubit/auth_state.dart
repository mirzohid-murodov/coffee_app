part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthErrorState extends AuthState {
  String? errorMessage;

  AuthErrorState({this.errorMessage});
}

class AuthSuccessState extends AuthState {}
