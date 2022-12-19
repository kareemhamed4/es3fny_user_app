import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/cubit/cubit.dart';
import 'package:es3fny_user_app/cubit/states.dart';
import 'package:es3fny_user_app/modules/splash/splash_screen.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//ignore: must_be_immutable
class NewPassword extends StatelessWidget {
  NewPassword({Key? key}) : super(key: key);

  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<MainCubit,MainStates>(
      listener: (context,state){},
      builder: (context,state){
        MainCubit cubit = BlocProvider.of(context);
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_outlined),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Text("create_password".tr(context),
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 32,
                            color: myFavColor
                          )),
                      SizedBox(
                        height: size.height * 0.201,
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          'create_password_enter'.tr(context),
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.016,
                      ),
                      myTextFormField(
                        validate: (value){
                          if(value!.length < 8){
                            return "create_password_valid".tr(context);
                          }
                          return null;
                        },
                        hint: '● ● ● ● ● ● ● ●',
                        textAlign: TextAlign.right,
                        type: TextInputType.visiblePassword,
                        isPassword: cubit.isPasswordCreate,
                        suffixIcon: IconButton(
                          onPressed: (){
                            cubit.changeSuffixIconCreate();
                          },
                            icon: Icon(cubit.suffixIconCreate,color: Theme.of(context).iconTheme.color,),
                        ),
                        context: context,
                        controller: passwordController,
                        onSubmit: (value) {},
                      ),
                      SizedBox(
                        height: size.height * 0.0123,
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          'create_confirm_password_enter'.tr(context),
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.016,
                      ),
                      myTextFormField(
                        validate: (value){
                          if(value != passwordController.text){
                            return "create_confirm_password_valid".tr(context);
                          }
                          return null;
                        },
                        hint: '● ● ● ● ● ● ● ●',
                        textAlign: TextAlign.right,
                        type: TextInputType.visiblePassword,
                        isPassword: cubit.isPasswordConfirmCreate,
                        suffixIcon: IconButton(
                            onPressed: (){
                              cubit.changeSuffixIconConfirmCreate();
                            },
                            icon: Icon(cubit.suffixIconConfirmCreate,color: Theme.of(context).iconTheme.color,)),
                        context: context,
                        controller: passwordConfirmController,
                        onSubmit: (value) {},
                      ),
                      SizedBox(
                        height: size.height * 0.123,
                      ),
                      myMaterialButton(
                        context: context,
                        onPressed: () {
                          if(formKey.currentState!.validate()){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('password_changed_snackBar'.tr(context))));
                            NavigateTo(context: context, widget: const SplashScreen());
                          }
                        },
                        label: "create_password_button".tr(context),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
