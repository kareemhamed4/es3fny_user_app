import 'package:es3fny_user_app/main_button/cubit/states.dart';
import 'package:es3fny_user_app/models/paramedic_model.dart';
import 'package:es3fny_user_app/models/send_request_model.dart';
import 'package:es3fny_user_app/network/endpoint.dart';
import 'package:es3fny_user_app/network/local/cache_helper.dart';
import 'package:es3fny_user_app/network/remote/dio_helper_advanced.dart';
import 'package:es3fny_user_app/shared/constants/constants.dart';
import 'package:es3fny_user_app/shared/location_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class SendRequestCubit extends Cubit<SendRequestStates> {
  SendRequestCubit() : super(SendRequestInitialState());
  static SendRequestCubit get(context) => BlocProvider.of(context);

  SendRequestModel? sendRequestModel;

  Future<void> sendRequest({
    required int userId,
    required String token,
  }) async {
    emit(SendRequestLoadingState());
    await DioHelper.postData(
      url: REQUEST,
      baseUrl: "${BASEURL}store/",
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

  ParamedicModel? paramedicModel;

  Future<void> listenForParamedicInfo({
    required int requestId,
  }) async {
    Stream.periodic(const Duration(seconds: 5)).asyncMap((_) async {
      try {
        emit(GetParamedicLoadingState());
        await DioHelper.getData(url: PARAMEDICINFO, baseUrl: BASEURL, query: {
          "id": requestId,
        }).then((value) {
          paramedicModel = ParamedicModel.fromJson(value.data);
          emit(GetParamedicSuccessState(paramedicModel!));
        }).catchError((error) {
          debugPrint(error.toString());
          emit(GetParamedicErrorState());
        });
        return paramedicModel;
      } catch (e) {
        return null;
      }
    }).listen((requests) {
      if (requests != null) {
        emit(GetParamedicSuccessState(requests));
      } else {
        emit(GetParamedicErrorState());
      }
    });
  }

  Future<void> getMyCurrentLocation() async {
    emit(GetCurrentLocationLoadingState());
    await LocationHelper.getCurrentLocation();
    CacheHelper.saveData(
      key: "currentLocation",
      value: Geolocator.getLastKnownPosition().whenComplete(
        () async {
          currentLocation =
              await Geolocator.getLastKnownPosition().whenComplete(
            () {
              emit(GetCurrentLocationSuccessState());
            },
          );
        },
      ).toString(),
    );
  }
}
