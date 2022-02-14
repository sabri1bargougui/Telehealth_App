part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

// ***  home event **** ///
class GoToHomeEvent extends NavigationEvent {}

// ***  appoitment event **** ///
class GoToAppoitmenEvent extends NavigationEvent {}

// ***  hystorical event **** ///
class GoToAppoitmentHistoricalEvent extends NavigationEvent {}

// ***  chat event **** ///
class GoToChatEvent extends NavigationEvent {}

// ***  doctors event **** ///
class GoToDoctorsEvent extends NavigationEvent {}

// ***  doctors event **** ///
class GoToDoctorsDetailsEvent extends NavigationEvent {}

// ***  about event **** ///
class GoToAboutEvent extends NavigationEvent {}

// ***  analys event **** ///
class GoToAnalysEvent extends NavigationEvent {}

// ***  analys DETAILS event **** ///
class GoToAnalysDetailsEvent extends NavigationEvent {}

// ***  news event **** ///
class GoToNewsEvent extends NavigationEvent {}

// ***  notification event **** ///
class GoToNotificationEvent extends NavigationEvent {}

// ***  profile event **** ///
class GoToProfileEvent extends NavigationEvent {}

// *** Editing profile event **** ///
class GoToEditingProfileEvent extends NavigationEvent {}

class GoToRegisterEvent extends NavigationEvent {}
