/*
import 'package:es3fny_user_app/models/login_model.dart';
import 'package:es3fny_user_app/modules/register/cubit/states.dart';
import 'package:es3fny_user_app/network/endpoint.dart';
import 'package:es3fny_user_app/network/remote/dio_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);
  LoginModel? signupModel;

  void userModel({
    required String name,
    required String email,
    required String nationalId,
    required String phone,
    required String gender,
    required int age,
    required String password,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data: {
        'name' : name,
        'email': email,
        'national_id': nationalId,
        'phone_number': phone,
        'gender': gender,
        'age': age,
        'password': password,
      },
    ).then((value) {
      if (kDebugMode) {
        signupModel = LoginModel.fromJson(value.data);
      }
      emit(RegisterSuccessState(signupModel!));
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(RegisterErrorState());
    });
  }

  bool isPassword = true;
  IconData suffixIcon = Icons.visibility_off_outlined;

  void changeRegisterSuffixIcon(){
    isPassword = !isPassword;
    suffixIcon = isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangeRegisterSuffixState());
  }

  bool isConfirmedPassword = true;
  IconData suffixIconConfirmed = Icons.visibility_off_outlined;

  void changeRegisterSuffixIconConfirmed(){
    isConfirmedPassword = !isConfirmedPassword;
    suffixIconConfirmed = isConfirmedPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangeRegisterSuffixState());
  }
}
*/
