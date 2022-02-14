import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  @override
  RegisterState get initialState => LoginState();

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is GoToRegisterEvent) {
      yield GoToRegisterState();
    }
    if (event is GoToLoginEvent) {
      yield LoginState();
    }
    if (event is GoToForgotPasswordEvent) {
      yield GoToForgotPasswordState();
    }
    if (event is GoToUploadPicEvent) {
      yield GoToUploadPicState();
    }
    if (event is GoToHomeEvent) {
      yield GoToHomeState();
    }
  }
}
