import 'package:es3fny_user_app/models/login_model.dart';
import 'package:es3fny_user_app/modules/login/cubit/states.dart';
import 'package:es3fny_user_app/network/endpoint.dart';
import 'package:es3fny_user_app/network/remote/dio_helper_advanced.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;

  Future<void> userLogin({
    required String phone,
    required String password,
  }) async{
    emit(LoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      baseUrl: BASEURL,
      data: {'phone_number': phone, 'password': password},
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      emit(LoginSuccessState(loginModel!));
    }).catchError((error) {
      debugPrint(error.toString());
      emit(LoginErrorState());
    });
  }

  bool isPassword = true;
  IconData suffixIcon = Icons.visibility_off_outlined;

  void changeLoginSuffixIcon() {
    isPassword = !isPassword;
    suffixIcon =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangeLoginSuffixState());
  }
}
