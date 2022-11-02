import 'package:es3fny_user_app/modules/register/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  IconData suffixIcon = Icons.visibility_off_outlined;
  void changeRegisterSuffixIcon(){
    isPassword = !isPassword;
    suffixIcon = isPassword ? Icons.visibility_off_outlined : Icons.remove_red_eye;
    emit(ChangeRegisterSuffixState());
  }

  bool isPasswordConfirm = true;
  IconData suffixIconConfirm = Icons.visibility_off_outlined;
  void changeRegisterSuffixIconConfirm(){
    isPasswordConfirm = !isPasswordConfirm;
    suffixIconConfirm = isPasswordConfirm ? Icons.visibility_off_outlined : Icons.remove_red_eye;
    emit(ChangeRegisterSuffixState());
  }
}
