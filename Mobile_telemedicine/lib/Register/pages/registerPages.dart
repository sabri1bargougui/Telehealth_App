import 'package:TELEMEDICINEAPP/Presentation/pages/navigationProvider.dart';
import 'package:TELEMEDICINEAPP/Register/Screens/SignupScreen.dart';
import 'package:TELEMEDICINEAPP/Register/Screens/forgotPasswordScreen.dart';
import 'package:TELEMEDICINEAPP/Register/Screens/loginsScreen.dart';
import 'package:TELEMEDICINEAPP/Register/Screens/uploadScreen.dart';
import 'package:TELEMEDICINEAPP/Register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        if (state is LoginState) {
          return Login();
        }

        if (state is GoToRegisterState) {
          return Singup();
        }

        if (state is GoToForgotPasswordState) {
          return ForgotPasswordScreen();
        }

        if (state is GoToUploadPicState) {
          return UploadPicScreen();
        }
        if (state is GoToHomeState) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            // add your code here.

            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => NavigationProvider()));
          });
        }
        return Container();
      },
    );
  }
}
