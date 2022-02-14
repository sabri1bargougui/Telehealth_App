import 'package:TELEMEDICINEAPP/Presentation/bloc/navigation_bloc.dart';
import 'package:TELEMEDICINEAPP/Register/bloc/register_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  //* ---------------------------------  Feature Sign in  --------------------------

  // ? Bloc
  sl.registerFactory(() => RegisterBloc());
  sl.registerFactory(() => NavigationBloc());
}
