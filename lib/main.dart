import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/bloc_observer.dart';
import 'package:es3fny_user_app/cubit/cubit.dart';
import 'package:es3fny_user_app/cubit/states.dart';
import 'package:es3fny_user_app/force_restart.dart';
import 'package:es3fny_user_app/layout/cubit/cubit.dart';
import 'package:es3fny_user_app/main_button/cubit/cubit.dart';
import 'package:es3fny_user_app/modules/chat_bot/cubit/cubit.dart';
import 'package:es3fny_user_app/modules/login/cubit/cubit.dart';
import 'package:es3fny_user_app/modules/login/login_screen.dart';
import 'package:es3fny_user_app/modules/notify_me/cubit/cubit.dart';
import 'package:es3fny_user_app/modules/on_boarding/on_boarding_screen.dart';
import 'package:es3fny_user_app/modules/prediction/cubit/cubit.dart';
import 'package:es3fny_user_app/modules/profile/cubit/cubit.dart';
import 'package:es3fny_user_app/modules/register/cubit/cubit.dart';
import 'package:es3fny_user_app/modules/splash/splash_screen.dart';
import 'package:es3fny_user_app/network/local/cache_helper.dart';
import 'package:es3fny_user_app/network/remote/dio_helper_advanced.dart';
import 'package:es3fny_user_app/shared/constants/constants.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:es3fny_user_app/shared/styles/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  DioHelper.init();
  token = CacheHelper.getData(key: 'token');
  otpCodeFromShared = CacheHelper.getData(key: 'otpCode');
  langContainerIndex = CacheHelper.getData(key: 'langContainerIndex');
  currentLocationAsString = CacheHelper.getData(key: 'currentLocation');
  langCode = CacheHelper.getData(key: 'lang');
  isDark = CacheHelper.getData(key: "isDark") ?? false;
  bool? onBoarding = CacheHelper.getData(key: "onBoarding");
  Widget widget;
  if(onBoarding != null){
    if(token != null){
      widget = const SplashScreen();
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => MainCubit()..changeAppMode(fromShared: isDark)..changeStartLang()..changeLanguageValue(langContainerIndex ?? 0)..checkingConnectivity()..checkingInternetConnection()),
        BlocProvider(create: (BuildContext context) => LoginCubit()),
        BlocProvider(create: (BuildContext context) => LayoutCubit()),
        BlocProvider(create: (BuildContext context) => ProfileCubit()..getUserData()..getFamilyMember(token: token!)),
        BlocProvider(create: (BuildContext context) => PhoneAuthCubit()),
        BlocProvider(create: (BuildContext context) => NotifyMeCubit()),
        BlocProvider(create: (BuildContext context) => ChatBotCubit()),
        BlocProvider(create: (BuildContext context) => PredictionCubit()),
        BlocProvider(create: (BuildContext context) => SendRequestCubit()..getMyCurrentLocation()),
        ],
      child: BlocConsumer<MainCubit,MainStates>(
        listener: (context,state){},
        builder: (context,state){
          MainCubit cubit = BlocProvider.of(context);
          return RestartWidget(
            child: AnnotatedRegion<SystemUiOverlayStyle>(
              value: !cubit.isDark ? const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarBrightness: Brightness.light,
                  statusBarIconBrightness: Brightness.dark,
                  systemNavigationBarColor: Colors.transparent,
                  systemNavigationBarIconBrightness: Brightness.dark
              ) : SystemUiOverlayStyle(
                statusBarColor: myFavColor8,
                statusBarIconBrightness: Brightness.light,
                systemNavigationBarColor: myFavColor8,
                systemNavigationBarIconBrightness: Brightness.light,
                statusBarBrightness: Brightness.light,
              ),
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                locale: Locale(langCode ?? "ar"),
                supportedLocales: const [Locale('ar'), Locale('en')],
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                localeResolutionCallback: (deviceLocale, supportedLocales) {
                  for (var locale in supportedLocales) {
                    if (deviceLocale != null &&
                        deviceLocale.languageCode == locale.languageCode) {
                      return deviceLocale;
                    }
                  }
                  return supportedLocales.first;
                },
                title: 'ES3FNY USER APP',
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode: MainCubit.get(context).isDark
                    ? ThemeMode.dark
                    : ThemeMode.light,
                home: startWidget,
              ),
            ),
          );
        },
      ),
    );
  }
}