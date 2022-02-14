import 'package:TELEMEDICINEAPP/Presentation/Screens/Analys/AnalysScreen.dart';
import 'package:TELEMEDICINEAPP/Presentation/Screens/Appoitment/AppoitmentScreen.dart';
import 'package:TELEMEDICINEAPP/Presentation/Screens/Appoitment/Appoitment_Historical_Screen.dart';
import 'package:TELEMEDICINEAPP/Presentation/Screens/Chat/ChatScreen.dart';
import 'package:TELEMEDICINEAPP/Presentation/Screens/Doctor/Doctor_Screen.dart';
import 'package:TELEMEDICINEAPP/Presentation/Screens/Home/AboutScreen.dart';
import 'package:TELEMEDICINEAPP/Presentation/Screens/Home/HomeScreen.dart';
import 'package:TELEMEDICINEAPP/Presentation/Screens/News/NewsScreen.dart';
import 'package:TELEMEDICINEAPP/Presentation/Screens/Notification/NotificationScreen.dart';
import 'package:TELEMEDICINEAPP/Presentation/Screens/Profile/ProfileEditindScreen.dart';
import 'package:TELEMEDICINEAPP/Presentation/Screens/Profile/ProfileScreen.dart';
import 'package:TELEMEDICINEAPP/Presentation/bloc/navigation_bloc.dart';
import 'package:TELEMEDICINEAPP/Register/pages/registerProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationPage extends StatelessWidget {
  NavigationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        // ** go to home screen **  ///
        if (state is GoToHomeState) {
          return HomeScreen();
        }
        // ** go to appoitment screen **  ///
        if (state is GoToAppoitmentState) {
          return AppoitmentScreen();
        }
        // ** go to hystorical screen **  ///
        if (state is GoToAppoitmenthistoricalState) {
          return HistoricScreen();
        }

        // ** go to chat screen **  ///
        if (state is GoToChatState) {
          return MessagesScreen();
        }
        // ** go to doctors screen **  ///
        if (state is GoToDoctorsState) {
          return DoctorScreen();
        }
        // ** go to doctors details screen **  ///
        if (state is GoToDoctorsDetailsState) {
          // return DoctorsDetailsScreen();
        }
        // ** go to about screen **  ///
        if (state is GoToAboutState) {
          return AboutScreen();
        }
        // ** go to analysis screen **  ///
        if (state is GoToAnalysState) {
          return AnalysScreen();
        }
        // ** go to analysis details  screen **  ///
        /* if (state is GoToAnalysDetailsState) {
          return AnalysDetailsScreen();
        }*/
        // ** go to news screen **  ///
        if (state is GoToNewsState) {
          return NewsScreen();
        }
        // ** go to notifications screen **  ///
        if (state is GoToNoticationState) {
          return NotificationScreen();
        }

        // ** go to profile screen **  ///
        if (state is GoToProfileState) {
          return ProfileScreen();
        }

        // ** go to  Editing profile screen **  ///
        if (state is GoToEditingProfileState) {
          return EditingProfileScreen();
        }

        if (state is GoToRegisterState) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            // add your code here.

            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => RegisterProvider()));
          });
        }

        return Container();
      },
    );
  }
}
