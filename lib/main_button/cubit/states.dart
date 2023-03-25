import 'package:es3fny_user_app/models/paramedic_model.dart';
import 'package:es3fny_user_app/models/send_request_model.dart';

abstract class SendRequestStates {}
class SendRequestInitialState extends SendRequestStates {}

class SendRequestLoadingState extends SendRequestStates {}
class SendRequestSuccessState extends SendRequestStates {
  final SendRequestModel sendRequest;
  SendRequestSuccessState(this.sendRequest);
}
class SendRequestErrorState extends SendRequestStates {}

class GetParamedicLoadingState extends SendRequestStates {}
class GetParamedicSuccessState extends SendRequestStates {
  final ParamedicModel paramedicModel;
  GetParamedicSuccessState(this.paramedicModel);
}
class GetParamedicErrorState extends SendRequestStates {}