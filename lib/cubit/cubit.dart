import 'package:es3fny_user_app/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(InitialState());

  static MainCubit get(context) => BlocProvider.of(context);

  bool isPasswordShown = false;
  Widget passwordIcon = Icon(Icons.add);
  void changePasswordState(){
    isPasswordShown = !isPasswordShown;
    emit(ChangePasswordState());
  }
}