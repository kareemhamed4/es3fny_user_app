import 'package:es3fny_user_app/modules/profile/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileStates>{
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  int currentPageIndex = 0;
  void changePageIndex(index){
    currentPageIndex = index;
    emit(ProfileChangePageIndexState());
  }
  bool isEnabled = false;

  bool isEditing = false;
  IconData editIcon = Icons.edit_outlined;
  void changeEditingState(){
    isEditing = !isEditing;
    editIcon = isEditing ? Icons.check : Icons.edit_outlined;
    isEnabled = !isEnabled;
    emit(ProfileChangeEditState());
  }
}