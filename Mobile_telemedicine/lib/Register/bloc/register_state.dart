part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class LoginState extends RegisterState {}

class GoToRegisterState extends RegisterState {}

class GoToForgotPasswordState extends RegisterState {}

class GoToUploadPicState extends RegisterState {}

class GoToHomeState extends RegisterState {}
