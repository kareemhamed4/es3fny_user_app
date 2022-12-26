import 'package:es3fny_user_app/modules/profile/cubit/states.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);

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
      if (kDebugMode) {
        print("database created");
      }
      await database
          .execute(
              'CREATE TABLE family (id INTEGER PRIMARY KEY, name TEXT, phone Text, nickname Text)')
          .then((value) {
        if (kDebugMode) {
          print("table created");
        }
      }).catchError((error) {
        if (kDebugMode) {
          print("Error occurred when creating Table (${error.toString()})");
        }
      });
    }, onOpen: (database) {
      getFamilyDataFromDatabase(database).then((value) {
        family = value;
        if (kDebugMode) {
          print(family);
        }
        emit(ProfileGetDataFromDatabaseState());
      });
      if (kDebugMode) {
        print("database opened");
      }
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
        if (kDebugMode) {
          print("$value Inserted Successfully");
          emit(ProfileInsertToDatabaseState());
        }
      }).catchError((error) {
        if (kDebugMode) {
          print("Error when Inserting Record ${error.toString()}");
        }
      });
      return null;
    });
  }

  void deleteData({required int id}) async{
    database.rawDelete(
      'DELETE FROM family WHERE id = ?', [id]
    ).then((value){
      emit(ProfileDeleteDataFromDatabaseState());
    });
  }
}
