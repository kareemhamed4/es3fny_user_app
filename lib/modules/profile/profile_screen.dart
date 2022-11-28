import 'package:es3fny_user_app/cubit/cubit.dart';
import 'package:es3fny_user_app/cubit/states.dart';
import 'package:es3fny_user_app/modules/login/login_screen.dart';
import 'package:es3fny_user_app/modules/on_boarding/on_boarding_screen.dart';
import 'package:es3fny_user_app/network/local/cache_helper.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit,MainStates>(
      listener: (context,state){},
      builder: (context,state){
        return Column(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: (){
                          MainCubit.get(context).changeAppMode();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Change App Mode",
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.blue),),
                        const SizedBox(width: 10,),
                        const Icon(Icons.brightness_4_outlined,color: Colors.blue,)
                      ],
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: (){
                       CacheHelper.clearData().then((value){
                        NavigateTo(context: context, widget: const OnBoardingScreen());
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Clear Data",
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.blue),),
                        const SizedBox(width: 10,),
                        const Icon(Icons.delete_outline,color: Colors.blue,)
                      ],
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: (){
                      MainCubit.get(context).signOut();
                      NavigateTo(context: context, widget: LoginScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Log Out",
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.blue),),
                        const SizedBox(width: 10,),
                        const Icon(Icons.logout_outlined,color: Colors.blue,)
                      ],
                    )
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
