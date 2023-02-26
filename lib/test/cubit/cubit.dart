import 'package:es3fny_user_app/models/test.dart';
import 'package:es3fny_user_app/network/endpoint.dart';
import 'package:es3fny_user_app/network/remote/dio_helper.dart';
import 'package:es3fny_user_app/test/cubit/states.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestCubit extends Cubit<TestStates> {
  TestCubit() : super(TestInitialState());

  static TestCubit get(context) => BlocProvider.of(context);

  String? prediction;
  Test? test;
  void testModel({
    required String name,
    required String email,
    required String nationalId,
    required String phone,
    required String gender,
    required String age,
    required String password,
    required String password2,
  }) {
    emit(TestLoadingState());
    DioHelper.postData(url: API, query: {
      'Pregnancies': name,
      'Glucose': email,
      'BloodPressure': nationalId,
      'SkinThickness': phone,
      'Insulin': gender,
      'BMI': age,
      'Age': password,
      'DiabetesPedigreeFunction': password2,
    }).then((value) {
      debugPrint(value.data.toString());
      test = Test.fromJson(value.data);
      prediction = test!.prediction;
      emit(TestSuccessState(test!));
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(TestErrorState());
    });
  }
}
