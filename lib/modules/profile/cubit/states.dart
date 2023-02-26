import 'package:es3fny_user_app/models/login_model.dart';

abstract class ProfileStates {}
class ProfileInitialState extends ProfileStates{}
class ProfileChangePageIndexState extends ProfileStates{}

class ProfileChangeEditState extends ProfileStates{}
class ProfileChangeFabIconState extends ProfileStates{}
class ProfileChangeScrollPhysicsState extends ProfileStates{}

class ProfileCreateDatabaseState extends ProfileStates{}
class ProfileInsertToDatabaseState extends ProfileStates{}

class ProfileGetDataFromDatabaseState extends ProfileStates{}
class ProfileDeleteDataFromDatabaseState extends ProfileStates{}
class ProfileUpdateDataFromDatabaseState extends ProfileStates{}

class ProfileIsEnabledGestureState extends ProfileStates{}

class UserProfileLoadingState extends ProfileStates{}
class UserProfileSuccessState extends ProfileStates{
  final LoginModel profileModel;
  UserProfileSuccessState(this.profileModel);
}
class UserProfileErrorState extends ProfileStates{}
