import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/modules/notify_me/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class NotifyMeCubit extends Cubit<NotifyMeStates> {
  NotifyMeCubit() : super(NotifyMeInitialState());
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
  void changeCalendarMode(String value, BuildContext context) {
    mode = value == modes[0].tr(context)
        ? DateRangePickerSelectionMode.multiple
        : DateRangePickerSelectionMode.range;
    emit(NotifyMeChangeCalendarModeState());
  }

  var formKey = GlobalKey<FormState>();
  TextEditingController treatmentNameController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  DateRangePickerController dateRangePickerController = DateRangePickerController();
  void changeTimeState({required String newTime}) {
    timeController.text = newTime;
    emit(NotifyMeChangeTimeState());
  }

  String selectedDate = '';
  List<String> selectedDates = [];
  String startDate = '';
  String secondDate = '';
  String range = '';

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
          // ignore: lines_longer_than_80_chars
          ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
    } else if (args.value is DateTime) {
      selectedDate = args.value.toString();
    }
    emit(NotifyMeChangeDateState());
  }
}
