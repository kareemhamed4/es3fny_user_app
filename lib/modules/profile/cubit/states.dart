import 'package:es3fny_user_app/models/family_model.dart';
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


class AddingFamilyMemberLoadingState extends ProfileStates{}
class AddingFamilyMemberSuccessState extends ProfileStates{
  final Family family;
  AddingFamilyMemberSuccessState(this.family);
}
class AddingFamilyMemberErrorState extends ProfileStates{}


class GetFamilyMembersLoadingState extends ProfileStates{}
class GetFamilyMembersSuccessState extends ProfileStates{}
class GetFamilyMembersErrorState extends ProfileStates{}


class DeleteFamilyMemberLoadingState extends ProfileStates{}
class DeleteFamilyMemberSuccessState extends ProfileStates{}
class DeleteFamilyMemberErrorState extends ProfileStates{}


class UpdateLocationLoadingState extends ProfileStates{}
class UpdateLocationSuccessState extends ProfileStates{}
class UpdateLocationErrorState extends ProfileStates{
  final String error;
  UpdateLocationErrorState(this.error);
}

class UpdateUserInfoLoadingState extends ProfileStates{}
class UpdateUserInfoSuccessState extends ProfileStates{
  final LoginModel updatedUser;
  UpdateUserInfoSuccessState(this.updatedUser);
}
class UpdateUserInfoErrorState extends ProfileStates{
  final String error;
  UpdateUserInfoErrorState(this.error);
}
