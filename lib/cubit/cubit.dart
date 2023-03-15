import 'package:es3fny_user_app/cubit/states.dart';
import 'package:es3fny_user_app/network/local/cache_helper.dart';
import 'package:es3fny_user_app/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(MainInitialState());

  static MainCubit get(context) => BlocProvider.of(context);

  bool isPasswordLogin = true;
  IconData suffixIconLogin = Icons.visibility_off_outlined;

  void changeSuffixIconLogin() {
    isPasswordLogin = !isPasswordLogin;
    suffixIconLogin =
        isPasswordLogin ? Icons.visibility_off_outlined : Icons.remove_red_eye;
    emit(ChangeSuffixState());
  }

  bool isPasswordCreate = true;
  IconData suffixIconCreate = Icons.visibility_off_outlined;

  void changeSuffixIconCreate() {
    isPasswordCreate = !isPasswordCreate;
    suffixIconCreate =
        isPasswordCreate ? Icons.visibility_off_outlined : Icons.remove_red_eye;
    emit(ChangeSuffixState());
  }

  bool isPasswordConfirmCreate = true;
  IconData suffixIconConfirmCreate = Icons.visibility_off_outlined;

  void changeSuffixIconConfirmCreate() {
    isPasswordConfirmCreate = !isPasswordConfirmCreate;
    suffixIconConfirmCreate = isPasswordConfirmCreate
        ? Icons.visibility_off_outlined
        : Icons.remove_red_eye;
    emit(ChangeSuffixState());
  }

  bool isDark = false;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
    } else {
      isDark = !isDark;
    }
    CacheHelper.saveData(key: 'isDark', value: isDark).then((value) {
      emit(ChangeAppModeState());
    });
  }

  void signOut() {
    CacheHelper.removeData(key: "uId");
    emit(SignOutState());
  }
  void changeStartLang() async {
    CacheHelper.getData(key: "lang");
    emit(ChangeStartLanguageState());
  }

  void changeLang(context, String data) async {
    langCode = data;
    emit(ChangeLanguageState(data));
    CacheHelper.saveData(key: "lang", value: data);
  }

  void changeLanguageValue(int value){
    langContainerIndex = value;
    CacheHelper.saveData(key: "langContainerIndex", value: value);
    emit(ChangeLangContainerState());
  }
}
