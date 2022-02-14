import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  @override
  NavigationState get initialState => GoToHomeState();

  @override
  Stream<NavigationState> mapEventToState(
    NavigationEvent event,
  ) async* {
    // ** go to home state **  ///
    if (event is GoToHomeEvent) {
      yield GoToHomeState();
    }
    // ** go to appoitment state **  ///
    if (event is GoToAppoitmenEvent) {
      yield GoToAppoitmentState();
    }

    // ** go to hystorical state **  ///
    if (event is GoToAppoitmentHistoricalEvent) {
      yield GoToAppoitmenthistoricalState();
    }
    // ** go to chat state **  ///
    if (event is GoToChatEvent) {
      yield GoToChatState();
    }
    // ** go to doctors state **  ///
    if (event is GoToDoctorsEvent) {
      yield GoToDoctorsState();
    }
    // ** go to doctors details state **  ///
    if (event is GoToDoctorsDetailsEvent) {
      yield GoToDoctorsDetailsState();
    }
    // ** go to about state **  ///
    if (event is GoToAboutEvent) {
      yield GoToAboutState();
    }
    // ** go to analys state **  ///
    if (event is GoToAnalysEvent) {
      yield GoToAnalysState();
    }
    // ** go to analys  details state **  ///
    if (event is GoToAnalysDetailsEvent) {
      yield GoToAnalysDetailsState();
    }
    // ** go to news state **  ///
    if (event is GoToNewsEvent) {
      yield GoToNewsState();
    }
    // ** go to notification state **  ///
    if (event is GoToNotificationEvent) {
      yield GoToNoticationState();
    }
    // ** go to profile state **  ///
    if (event is GoToProfileEvent) {
      yield GoToProfileState();
    }
    // ** go to editing  profile state **  ///
    if (event is GoToEditingProfileEvent) {
      yield GoToEditingProfileState();
    }
    if (event is GoToRegisterEvent) {
      yield GoToRegisterState();
    }
  }
}
