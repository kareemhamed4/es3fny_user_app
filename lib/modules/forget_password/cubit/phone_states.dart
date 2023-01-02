abstract class PhoneAuthStates {}

class PhoneAuthInitialState extends PhoneAuthStates {}

class PhoneAuthLoadingState extends PhoneAuthStates {}
class PhoneAuthErrorState extends PhoneAuthStates {
  final String errorMsg;
  PhoneAuthErrorState({required this.errorMsg});
}
class PhoneNumberSubmitted extends PhoneAuthStates {}
class PhoneOTPVerified extends PhoneAuthStates {}