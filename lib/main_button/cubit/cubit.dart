import 'package:es3fny_user_app/main_button/cubit/states.dart';
import 'package:es3fny_user_app/models/send_request_model.dart';
import 'package:es3fny_user_app/network/endpoint.dart';
import 'package:es3fny_user_app/network/remote/dio_helper_advanced.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendRequestCubit extends Cubit<SendRequestStates> {
  SendRequestCubit() : super(SendRequestInitialState());
  static SendRequestCubit get(context) => BlocProvider.of(context);

  SendRequestModel? sendRequestModel;

  void sendRequest({
    required int userId,
    required String token,
  }) {
    emit(SendRequestLoadingState());
    DioHelper.postData(
      url: REQUEST,
      baseUrl: "http://192.168.1.12/api/store/",
      data: {
        'user_id': userId,
        'token': token,
      },
    ).then((value) {
      debugPrint(value.data.toString());
      sendRequestModel = SendRequestModel.fromJson(value.data);
      emit(SendRequestSuccessState(sendRequestModel!));
    }).catchError((error) {
      debugPrint(error.toString());
      emit(SendRequestErrorState());
    });
  }

/*  late Timer timer;
  late AnimationController controller;
  int totalSeconds = 3;
  int secondsRemaining = 3;
  double progressFraction = 0.0;
  int percentage = 0;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      secondsRemaining -= 1;
      progressFraction = (totalSeconds - secondsRemaining) / totalSeconds;
      percentage = (progressFraction * 100).floor();
      if (controller.status == AnimationStatus.reverse) {
        reset();
      }
      if (controller.status == AnimationStatus.dismissed) {
        reset();
      }
      if (controller.status == AnimationStatus.completed) {
        emit(LoadingButtonCompleted());
      }
    });
    controller.forward();
    emit(LoadingButtonStarted());
  }

  void reset() {
    controller.reset();
    timer.cancel();
    secondsRemaining = 3;
    progressFraction = 0.0;
    percentage = 0;
    emit(LoadingButtonInitial());
  }

  void handleTapDown() {
    controller.forward();
  }

  void handleTapUp() {
    if (controller.status == AnimationStatus.forward) {
      controller.reverse();
    }
  }

  void navigateToTrackingInfo(BuildContext context) {
    showMyDialog(
      context: context,
      icon: Icons.info_outline,
      titleWidget: Text(
        "alert".tr(context),
        style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
      ),
      contentWidget: Text(
        "alert_content".tr(context),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 18),
      ),
      onConfirm: () {
        Navigator.pop(context, "Ok");
        context.read<SendRequestCubit>().sendRequest(
          token: token!,
          userId: ProfileCubit.get(context).userModel!.data!.id!,
        );
        context.read<LayoutCubit>().changeIndex(1);
        NavigateTo(context: context, widget: const TrackingInfoScreen());
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Future<void> close() {
    controller.dispose();
    timer.cancel();
    return super.close();
  }*/
}
