import 'package:es3fny_user_app/layout/cubit/states.dart';
import 'package:es3fny_user_app/modules/help_services/help_services_screen.dart';
import 'package:es3fny_user_app/modules/home/home_screen.dart';
import 'package:es3fny_user_app/modules/profile/profile_screen.dart';
import 'package:es3fny_user_app/modules/tracking/tracking_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());
  LayoutCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    const HomeScreen(),
    const TrackingScreen(),
    const HelpServicesScreen(),
    const ProfileScreen(),
  ];

  int currentIndex = 0;
  void changeIndex(index){
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }

}
