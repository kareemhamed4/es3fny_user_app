import 'package:es3fny_user_app/models/send_request_model.dart';

abstract class SendRequestStates {}
class SendRequestInitialState extends SendRequestStates {}

class SendRequestLoadingState extends SendRequestStates {}
class SendRequestSuccessState extends SendRequestStates {
  final SendRequestModel sendRequest;
  SendRequestSuccessState(this.sendRequest);
}
class SendRequestErrorState extends SendRequestStates {}