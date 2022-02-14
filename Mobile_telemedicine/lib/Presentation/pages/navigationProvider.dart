import 'package:TELEMEDICINEAPP/Ingection/ingection.dart';
import 'package:TELEMEDICINEAPP/Presentation/bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigationPages.dart';

class NavigationProvider extends StatelessWidget {
  const NavigationProvider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return true;
      },
      child: Scaffold(
        body: BlocProvider(
          builder: (_) => sl<NavigationBloc>(),
          child: NavigationPage(),
        ),
      ),
    );
  }
}
