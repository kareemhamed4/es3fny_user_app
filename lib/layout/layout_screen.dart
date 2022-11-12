import 'package:es3fny_user_app/layout/cubit/cubit.dart';
import 'package:es3fny_user_app/layout/cubit/states.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit,LayoutStates>(
        listener: (context,state) => {},
        builder: (context,state) {
          LayoutCubit cubit = BlocProvider.of(context);
          return Scaffold(
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: Directionality(
              textDirection: TextDirection.rtl,
              child: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(icon: Container(
                    decoration: (cubit.currentIndex == 0) ? BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: myFavColor,
                          width: 3
                        )
                      )
                    ) : const BoxDecoration(),
                      child: Column(
                        children: const [
                          SizedBox(height: 14,),
                          Icon(FluentIcons.home_24_regular),
                        ],
                      ),
                  ),label: "الرئيسية"),
                  BottomNavigationBarItem(icon: Container(
                      decoration: (cubit.currentIndex == 1) ? BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  color: myFavColor,
                                  width: 3
                              )
                          )
                      ) : const BoxDecoration(),
                      child: Column(
                        children: const [
                          SizedBox(height: 14,),
                          Icon(FluentIcons.location_24_regular),
                        ],
                      )),label: "التتبع"),
                  BottomNavigationBarItem(icon: Container(
                      decoration: (cubit.currentIndex == 2) ? BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  color: myFavColor,
                                  width: 3
                              )
                          )
                      ) : const BoxDecoration(),
                      child: Column(
                        children: const [
                          SizedBox(height: 14,),
                          Icon(FluentIcons.glance_24_regular),
                        ],
                      )),label: "الخدمات"),
                  BottomNavigationBarItem(icon: Container(
                      decoration: (cubit.currentIndex == 3) ? BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  color: myFavColor,
                                  width: 3
                              )
                          )
                      ) : const BoxDecoration(),
                      child: Column(
                        children: const [
                          SizedBox(height: 14,),
                          Icon(FluentIcons.person_24_regular),
                        ],
                      )),label: "الملف الشخصي"),
                ],
                currentIndex: cubit.currentIndex,
                onTap: (index){
                  cubit.changeIndex(index);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
