/*
import 'package:es3fny_user_app/main_button/cubit/cubit.dart';
import 'package:es3fny_user_app/main_button/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingButton2 extends StatelessWidget {
  final SendRequestCubit cubit;
  final String text;

  const LoadingButton2({Key? key, required this.cubit, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendRequestCubit, SendRequestStates>(
      bloc: cubit,
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state is LoadingButtonInitial ? cubit.startTimer : null,
          child: state is LoadingButtonLoading
              ? const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          )
              : Text(text),
        );
      },
    );
  }
}
*/
