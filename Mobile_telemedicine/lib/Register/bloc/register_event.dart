part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class GoToRegisterEvent extends RegisterEvent {}

class GoToLoginEvent extends RegisterEvent {}

class GoToForgotPasswordEvent extends RegisterEvent {}

class GoToUploadPicEvent extends RegisterEvent {}

class GoToHomeEvent extends RegisterEvent {}
