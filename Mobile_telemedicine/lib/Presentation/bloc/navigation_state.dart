part of 'navigation_bloc.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class NavigationInitial extends NavigationState {}

// ***  home state **** ///
class GoToHomeState extends NavigationState {}

// ***  appoitment state **** ///
class GoToAppoitmentState extends NavigationState {}

// ***  hystorical state **** ///
class GoToAppoitmenthistoricalState extends NavigationState {}

// ***  chat state **** ///
class GoToChatState extends NavigationState {}

// ***  doctors state **** ///
class GoToDoctorsState extends NavigationState {}

// ***  doctors details state **** ///
class GoToDoctorsDetailsState extends NavigationState {}

// ***  about state **** ///
class GoToAboutState extends NavigationState {}

// ***  analys state **** ///
class GoToAnalysState extends NavigationState {}

// ***  analys details  state **** ///
class GoToAnalysDetailsState extends NavigationState {}

// ***  news state **** ///
class GoToNewsState extends NavigationState {}

// ***  profile state **** ///
class GoToProfileState extends NavigationState {}

// ***  Editing profile state **** ///
class GoToEditingProfileState extends NavigationState {}

// ***  notification state **** ///
class GoToNoticationState extends NavigationState {}

class GoToRegisterState extends NavigationState {}
