import 'package:TELEMEDICINEAPP/Ingection/ingection.dart';
import 'package:TELEMEDICINEAPP/Register/bloc/register_bloc.dart';
import 'package:TELEMEDICINEAPP/Register/pages/registerPages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterProvider extends StatelessWidget {
  const RegisterProvider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => null,
      child: Scaffold(
        body: BlocProvider(
          builder: (_) => sl<RegisterBloc>(),
          child: RegisterPage(),
        ),
      ),
    );
  }
}
