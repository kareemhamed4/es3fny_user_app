import 'package:es3fny_user_app/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(MainInitialState());

  static MainCubit get(context) => BlocProvider.of(context);

  bool isPasswordLogin = true;
  IconData suffixIconLogin = Icons.visibility_off_outlined;

  void changeSuffixIconLogin(){
    isPasswordLogin = !isPasswordLogin;
    suffixIconLogin = isPasswordLogin ? Icons.visibility_off_outlined : Icons.remove_red_eye;
    emit(ChangeSuffixState());
  }

  bool isPasswordRegister = true;
  IconData suffixIconRegister = Icons.visibility_off_outlined;

  void changeSuffixIconRegister(){
    isPasswordRegister = !isPasswordRegister;
    suffixIconRegister = isPasswordRegister ? Icons.visibility_off_outlined : Icons.remove_red_eye;
    emit(ChangeSuffixState());
  }

  bool isPasswordConfirmRegister = true;
  IconData suffixIconConfirmRegister = Icons.visibility_off_outlined;

  void changeSuffixIconConfirmRegister(){
    isPasswordConfirmRegister = !isPasswordConfirmRegister;
    suffixIconConfirmRegister = isPasswordConfirmRegister ? Icons.visibility_off_outlined : Icons.remove_red_eye;
    emit(ChangeSuffixState());
  }

  bool isPasswordCreate = true;
  IconData suffixIconCreate = Icons.visibility_off_outlined;

  void changeSuffixIconCreate(){
    isPasswordCreate = !isPasswordCreate;
    suffixIconCreate = isPasswordCreate ? Icons.visibility_off_outlined : Icons.remove_red_eye;
    emit(ChangeSuffixState());
  }

  bool isPasswordConfirmCreate = true;
  IconData suffixIconConfirmCreate = Icons.visibility_off_outlined;

  void changeSuffixIconConfirmCreate(){
    isPasswordConfirmCreate = !isPasswordConfirmCreate;
    suffixIconConfirmCreate = isPasswordConfirmCreate ? Icons.visibility_off_outlined : Icons.remove_red_eye;
    emit(ChangeSuffixState());
  }

}
