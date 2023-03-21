import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/modules/notify_me/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class NotifyMeCubit extends Cubit<NotifyMeStates> {
  NotifyMeCubit(): super(NotifyMeInitialState());
  static NotifyMeCubit get(context) => BlocProvider.of(context);

  List<String> quantity = [
    "1",
    "2",
    "3",
    "4",
    "5",
  ];
  String? selectedQuantity;

  List<String> modes = [
    "multiple",
    "range",
  ];
  String? selectedMode;

  DateRangePickerSelectionMode mode = DateRangePickerSelectionMode.multiple;
  void changeCalendarMode(String value,BuildContext context){
    mode = value == modes[0].tr(context) ? DateRangePickerSelectionMode.multiple: DateRangePickerSelectionMode.range;
    emit(NotifyMeChangeCalendarModeState());
  }

  var formKey = GlobalKey<FormState>();
  TextEditingController treatmentNameController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  void changeTimeState({required String newTime}){
    timeController.text = newTime;
    emit(NotifyMeChangeTimeState());
  }

  String selectedDate = '';
  String startDate = '';
  String secondDate = '';
  String range = '';

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args){
    if (args.value is PickerDateRange) {
      range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
      // ignore: lines_longer_than_80_chars
          ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
    } else if (args.value is DateTime) {
      selectedDate = args.value.toString();
    }
    emit(NotifyMeChangeDateState());
  }

  late Database database;
  List<Map> treatment = [];
  void createDatabase() async {
    database = await openDatabase("treatment.db", version: 1,
        onCreate: (database, version) async {
      debugPrint("database created");
      await database
          .execute(
              'CREATE TABLE treatment (id INTEGER PRIMARY KEY, treatmentName TEXT, quantity TEXT, selectedDates TEXT ARRAY, startDate Text, endDate TEXT, time TEXT)')
          .then((value) {
        debugPrint("table created");
      }).catchError((error) {
        debugPrint("Error occurred when creating Table (${error.toString()})");
      });
    }, onOpen: (database) {
      getTreatmentDataFromDatabase(database).then((value) {
        treatment = value;
        debugPrint(treatment.toString());
        emit(GetTreatmentDataFromDatabaseState());
      });
      debugPrint("database opened");
    });
  }

  Future<List<Map>> getTreatmentDataFromDatabase(database) async {
    return await database.rawQuery("SELECT * FROM family");
  }

  insertToDatabase({
    required String treatmentName,
    required String quantity,
    required List<String> selectedDates,
    required String startDate,
    required String endDate,
    required String time,
  }) {
    return database.transaction((txn) async {
      await txn
          .rawInsert(
              'INSERT INTO treatment(treatmentName, quantity, startDate, endDate, time) VALUES("$treatmentName", "$quantity", "$selectedDates", "$startDate", "$endDate", "$time")')
          .then((value) {
        debugPrint("${value.toString()} Inserted Successfully");
        emit(TreatmentInsertToDatabaseState());
      }).catchError((error) {
        debugPrint("Error when Inserting Record ${error.toString()}");
      });
      return null;
    });
  }

  void deleteData({required int id}) async {
    database.rawDelete('DELETE FROM family WHERE id = ?', [id]).then((value) {
      getTreatmentDataFromDatabase(database).then((value) {
        treatment = value;
        debugPrint(treatment.toString());
      });
      emit(TreatmentDeleteDataFromDatabaseState());
    });
  }

  void updateData(String sql) async {
    await database.rawUpdate(sql).then((value) {
      getTreatmentDataFromDatabase(database).then((value) {
        treatment = value;
        debugPrint(treatment.toString());
      });
      emit(TreatmentUpdateDataFromDatabaseState());
    });
  }
}