import 'package:es3fny_user_app/modules/profile/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileStates>{
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  int currentPageIndex = 0;
  void changePageIndex(index){
    currentPageIndex = index;
    emit(ProfileChangePageIndexState());
  }
}