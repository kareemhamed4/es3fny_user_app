import 'dart:async';
import 'package:es3fny_user_app/models/family_model.dart';
import 'package:es3fny_user_app/models/login_model.dart';
import 'package:es3fny_user_app/modules/profile/cubit/states.dart';
import 'package:es3fny_user_app/network/endpoint.dart';
import 'package:es3fny_user_app/network/local/cache_helper.dart';
import 'package:es3fny_user_app/network/remote/dio_helper_advanced.dart';
import 'package:es3fny_user_app/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  final List<String> genderItems = [
    'male',
    'female',
  ];
  String selectedValue = "";

  LoginModel? userModel;
  Future<void> getUserData() async {
    emit(UserProfileLoadingState());

    await DioHelper.getData(
      url: PROFILE,
      baseUrl: BASEURL,
      token: token,
    ).then((value) {
      userModel = LoginModel.fromJson(value.data);
      emit(UserProfileSuccessState(userModel!));
    }).catchError((error) {
      debugPrint(error.toString());
      emit(UserProfileErrorState());
    });
  }

  LoginModel? updatedUser;
  void updateUserInfo({
    String? name,
    String? nationalId,
    String? phone,
    int? gender,
    int? age,
    String? email,
  }) {
    emit(UpdateUserInfoLoadingState());
    DioHelper.postData(
      url: UPDATE_PROFILE,
      baseUrl: BASEURL,
      token: token,
      data: {
        'name': name,
        'national_id': nationalId,
        'phone_number': phone,
        'gender': gender,
        'age': age,
        'email': email,
      },
    ).then((value) {
      updatedUser = LoginModel.fromJson(value.data);
      getUserData();
      emit(UpdateUserInfoSuccessState(updatedUser!));
    }).catchError((error) {
      debugPrint(error.toString());
      emit(UpdateUserInfoErrorState(error.toString()));
    });
  }

  int currentPageIndex = 0;
  void changePageIndex(index) {
    currentPageIndex = index;
    emit(ProfileChangePageIndexState());
  }

  bool isEnabled = false;

  bool isEditing = false;
  IconData editIcon = Icons.edit_outlined;
  void changeEditingState() {
    isEditing = !isEditing;
    editIcon = isEditing ? Icons.check : Icons.edit_outlined;
    isEnabled = !isEnabled;
    emit(ProfileChangeEditState());
  }

  IconData fabIcon = Icons.edit_outlined;
  bool isBottomSheetShown = false;
  void changeFabIcon() {
    isBottomSheetShown = !isBottomSheetShown;
    fabIcon = isBottomSheetShown ? Icons.add : Icons.edit_outlined;
    emit(ProfileChangeFabIconState());
  }

  ScrollPhysics scrollPhysics = const BouncingScrollPhysics();
  void changeScrollPhysics() {
    scrollPhysics = isBottomSheetShown ? const NeverScrollableScrollPhysics() : const BouncingScrollPhysics();
    emit(ProfileChangeScrollPhysicsState());
  }

  bool isEnabledGesture = true;
  void changeIsEnabledGestureState({required bool isEnabled}) {
    isEnabledGesture = isEnabled;
    emit(ProfileIsEnabledGestureState());
  }

  String splitSentence(String sentence) {
    List<String> splitted = sentence.split(" ");
    return splitted.first.toString();
  }

  Family? addMemberModel;
  void addFamilyMember({
    required String name,
    required String phone,
    required String kinship,
  }) {
    emit(AddingFamilyMemberLoadingState());
    DioHelper.postData(
      baseUrl: BASEURL,
      url: ADD_FAMILY_MEMBER,
      data: {
        "name": name,
        "phone_number": phone,
        "kinship": kinship,
      },
      token: token,
    ).then((value) {
      addMemberModel = Family.fromJson(value.data);
      getFamilyMember();
      emit(AddingFamilyMemberSuccessState(addMemberModel!));
    }).catchError((error) {
      emit(AddingFamilyMemberErrorState());
    });
  }

  Family? familyMembers;
  void getFamilyMember() {
    emit(GetFamilyMembersLoadingState());
    DioHelper.getData(
      baseUrl: BASEURL,
      url: GET_FAMILY_MEMBER,
      token: token,
    ).then((value) {
      familyMembers = Family.fromJson(value.data);
      emit(GetFamilyMembersSuccessState());
    }).catchError((error) {
      emit(GetFamilyMembersErrorState());
    });
  }

  void deleteFamilyMember({
    required int memberId,
  }) {
    emit(DeleteFamilyMemberLoadingState());
    DioHelper.getData(
      baseUrl: BASEURL,
      url: "$Delete_FAMILY_MEMBER/$memberId",
      token: token,
    ).then((value) {
      getFamilyMember();
      emit(DeleteFamilyMemberSuccessState());
    }).catchError((error) {
      emit(DeleteFamilyMemberErrorState());
    });
  }

  StreamSubscription<Position>? _positionStreamSubscription;

  Future<void> startLocationUpdates() async {
    await getUserData();
    emit(UpdateLocationLoadingState());
    _positionStreamSubscription = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10, // Minimum distance (in meters) before receiving updates
      ),
    ).listen((Position position) {
      CacheHelper.saveData(key: "currentLatitude",value: position.latitude).then((value){
        currentLatitude = position.latitude;
      });
      CacheHelper.saveData(key: "currentLongitude",value: position.longitude).then((value){
        currentLongitude = position.longitude;
      });
      // Call the update method with the new latitude and longitude values
      if (token != null) {
        updateLocation(latitude: position.latitude,longitude: position.longitude);
      }
    });
  }

  void updateLocation({
    required double latitude,
    required double longitude,
  }) {
    DioHelper.postData(
      baseUrl: BASEURL,
      url: UPDATELOCATION,
      token: token,
      data: {
        "latitude": latitude,
        "longitude": longitude,
      },
    ).then((value) {
      emit(UpdateLocationSuccessState());
    }).catchError((error) {
      emit(UpdateLocationErrorState(error.toString()));
    });
  }

  void stopLocationUpdates() {
    _positionStreamSubscription?.cancel();
    _positionStreamSubscription = null;
  }
}
