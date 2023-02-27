import 'package:es3fny_user_app/models/login_model.dart';
import 'package:es3fny_user_app/modules/profile/cubit/states.dart';
import 'package:es3fny_user_app/network/endpoint.dart';
import 'package:es3fny_user_app/network/remote/dio_helper_advanced.dart';
import 'package:es3fny_user_app/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  LoginModel? userModel;

  void getUserData() {
    emit(UserProfileLoadingState());

    DioHelper.getData(
        url: PROFILE,
        baseUrl: "http://192.168.1.12/api/",
        token: token,
        query: {
      "token": token,
    }).then((value) {
      userModel = LoginModel.fromJson(value.data);
      debugPrint(value.data.toString());
      emit(UserProfileSuccessState(userModel!));
    }).catchError((error) {
      debugPrint(error.toString());
      emit(UserProfileErrorState());
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
    scrollPhysics = isBottomSheetShown
        ? const NeverScrollableScrollPhysics()
        : const BouncingScrollPhysics();
    emit(ProfileChangeScrollPhysicsState());
  }

  late Database database;
  List<Map> family = [];
  void createDatabase() async {
    database = await openDatabase("familyInfo.db", version: 1,
        onCreate: (database, version) async {
      debugPrint("database created");
      await database
          .execute(
              'CREATE TABLE family (id INTEGER PRIMARY KEY, name TEXT, phone Text, nickname Text)')
          .then((value) {
        debugPrint("table created");
      }).catchError((error) {
        debugPrint("Error occurred when creating Table (${error.toString()})");
      });
    }, onOpen: (database) {
      getFamilyDataFromDatabase(database).then((value) {
        family = value;
        debugPrint(family.toString());
        emit(ProfileGetDataFromDatabaseState());
      });
      debugPrint("database opened");
    });
  }

  Future<List<Map>> getFamilyDataFromDatabase(database) async {
    return await database.rawQuery("SELECT * FROM family");
  }

  insertToDatabase({
    required String name,
    required String phone,
    required String nickname,
  }) {
    return database.transaction((txn) async {
      await txn
          .rawInsert(
              'INSERT INTO family(name, phone, nickname) VALUES("$name", "$phone", "$nickname")')
          .then((value) {
        debugPrint("${value.toString()} Inserted Successfully");
        emit(ProfileInsertToDatabaseState());
      }).catchError((error) {
        debugPrint("Error when Inserting Record ${error.toString()}");
      });
      return null;
    });
  }

  void deleteData({required int id}) async {
    database.rawDelete('DELETE FROM family WHERE id = ?', [id]).then((value) {
      getFamilyDataFromDatabase(database).then((value) {
        family = value;
        debugPrint(family.toString());
      });
      emit(ProfileDeleteDataFromDatabaseState());
    });
  }

  void updateData(String sql) async {
    await database.rawUpdate(sql).then((value) {
      getFamilyDataFromDatabase(database).then((value) {
        family = value;
        debugPrint(family.toString());
      });
      emit(ProfileUpdateDataFromDatabaseState());
    });
  }

  bool isEnabledGesture = true;
  void changeIsEnabledGestureState({required bool isEnabled}) {
    isEnabledGesture = isEnabled;
    emit(ProfileIsEnabledGestureState());
  }

  String splitSentence(String sentence){
    List<String> splitted = sentence.split(" ");
    return splitted.first.toString();
  }
}
