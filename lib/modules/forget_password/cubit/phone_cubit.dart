import 'package:es3fny_user_app/modules/forget_password/cubit/phone_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthStates> {
  PhoneAuthCubit() : super(PhoneAuthInitialState());

  static PhoneAuthCubit get(context) => BlocProvider.of(context);
  late String verificationId;

  Future<void> submitPhoneNumber(String phoneNumber) async {
    emit(PhoneAuthLoadingState());
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+20$phoneNumber',
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    if (kDebugMode) {
      print("verificationCompleted");
    }
    await signIn(credential);
  }

  void verificationFailed(FirebaseAuthException error) {
    if (kDebugMode) {
      print("verificationFailed: ${error.toString()}");
    }
    emit(PhoneAuthErrorState(errorMsg: error.toString()));
  }

  void codeSent(String verificationId, int? resendToken) {
    if (kDebugMode) {
      print("codeSent");
    }
    this.verificationId = verificationId;
    emit(PhoneNumberSubmitted());
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    if (kDebugMode) {
      print("codeAutoRetrievalTimeout");
    }
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

  User getLoggedInUser(){
    User firebaseUser = FirebaseAuth.instance.currentUser!;
    return firebaseUser;
  }
}
