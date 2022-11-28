import 'package:es3fny_user_app/cubit/cubit.dart';
import 'package:es3fny_user_app/cubit/states.dart';
import 'package:es3fny_user_app/layout/cubit/cubit.dart';
import 'package:es3fny_user_app/layout/layout_screen.dart';
import 'package:es3fny_user_app/modules/login/login_screen.dart';
import 'package:es3fny_user_app/modules/on_boarding/on_boarding_screen.dart';
import 'package:es3fny_user_app/network/local/cache_helper.dart';
import 'package:es3fny_user_app/shared/constants/constants.dart';
import 'package:es3fny_user_app/shared/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  uId = CacheHelper.getData(key: 'uId');
  bool isDark = CacheHelper.getData(key: "isDark") ?? false ;
  bool? onBoarding = CacheHelper.getData(key: "onBoarding");
  Widget widget;
  if(onBoarding != null){
    if(uId != null){
      widget = const LayoutScreen();
    }else{
      widget = LoginScreen();
    }
  }else {
    widget = const OnBoardingScreen();
  }
  runApp(MyApp(
    startWidget: widget,
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  final Widget startWidget;
  const MyApp({super.key,required this.startWidget,required this.isDark});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => MainCubit()..changeAppMode(fromShared: isDark),),
        BlocProvider(create: (BuildContext context) => LayoutCubit()),
        ],
      child: BlocConsumer<MainCubit,MainStates>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'ES3FNY USER APP',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: MainCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: startWidget,
          );
        },
      ),
    );
  }
}