import 'package:es3fny_user_app/models/login_model.dart';
import 'package:es3fny_user_app/modules/register/cubit/states.dart';
import 'package:es3fny_user_app/network/endpoint.dart';
import 'package:es3fny_user_app/network/remote/dio_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthStates> {
  PhoneAuthCubit() : super(PhoneAuthInitialState());

  static PhoneAuthCubit get(context) => BlocProvider.of(context);
  late String verificationId;

  Future<void> submitPhoneNumber(String phoneNumber) async {
    emit(PhoneAuthLoadingState());
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    debugPrint("verificationCompleted");
    await signIn(credential);
  }

  void verificationFailed(FirebaseAuthException error) {
    debugPrint("verificationFailed: ${error.toString()}");
    emit(PhoneAuthErrorState(errorMsg: error.toString()));
  }

  void codeSent(String verificationId, int? resendToken) {
    debugPrint("codeSent");
    this.verificationId = verificationId;
    emit(PhoneNumberSubmitted());
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    debugPrint("codeAutoRetrievalTimeout");
  }

  Future<void> submitOTP(String otpCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otpCode,
    );
    await signIn(credential);
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(PhoneOTPVerified());
    } catch (error) {
      emit(PhoneAuthErrorState(errorMsg: error.toString()));
    }
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  User getLoggedInUser() {
    User firebaseUser = FirebaseAuth.instance.currentUser!;
    return firebaseUser;
  }

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
    emit(SignUpLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data: {
        'name': name,
        'email': email,
        'national_id': nationalId,
        'phone_number': phone,
        'gender': gender,
        'age': age,
        'password': password,
      },
    ).then((value) {
      debugPrint(value.data.toString());
      signupModel = LoginModel.fromJson(value.data);
      emit(SignUpSuccessState(signupModel!));
    }).catchError((error) {
      debugPrint(error.toString());
      emit(SignUpErrorState(error.toString()));
    });
  }

  //register cubit functions
  bool isPasswordRegister = true;
  IconData suffixIconRegister = Icons.visibility_off_outlined;

  void changeSuffixIconRegister() {
    isPasswordRegister = !isPasswordRegister;
    suffixIconRegister = isPasswordRegister
        ? Icons.visibility_off_outlined
        : Icons.remove_red_eye;
    emit(ChangeSuffixState());
  }

  bool isPasswordConfirmRegister = true;
  IconData suffixIconConfirmRegister = Icons.visibility_off_outlined;

  void changeSuffixIconConfirmRegister() {
    isPasswordConfirmRegister = !isPasswordConfirmRegister;
    suffixIconConfirmRegister = isPasswordConfirmRegister
        ? Icons.visibility_off_outlined
        : Icons.remove_red_eye;
    emit(ChangeSuffixState());
  }

  bool isEnabledButton = true;
  void changeButtonState(int length) {
    isEnabledButton = length == 1 ? true : false;
    emit(ChangeButtonState());
  }
}
