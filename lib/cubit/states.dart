abstract class MainStates {}

class MainInitialState extends MainStates {}

class MainLoadingState extends MainStates {}
class MainSuccessState extends MainStates {
  final String uId;

  MainSuccessState(this.uId);
}
class MainErrorState extends MainStates {}
class ChangeSuffixState extends MainStates {}
class SignOutState extends MainStates {}
class ChangeAppModeState extends MainStates {}

class ChangeLanguageState extends MainStates {
  final String langCode;

  ChangeLanguageState(this.langCode);
}
class ChangeStartLanguageState extends MainStates {}
class ChangeRadioState extends MainStates {}
class ChangeLangContainerState extends MainStates {}
