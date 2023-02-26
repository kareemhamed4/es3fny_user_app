import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/test/cubit/cubit.dart';
import 'package:es3fny_user_app/test/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TEST extends StatefulWidget {
  const TEST({Key? key}) : super(key: key);

  @override
  State<TEST> createState() => _TESTState();
}

class _TESTState extends State<TEST> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();
  TextEditingController controller7 = TextEditingController();
  TextEditingController controller8 = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TestCubit,TestStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar: defaultAppBar(),
          body: Form(
            key: formKey,
            child: Column(
              children: [
                myTextFormField(
                  context: context,
                  controller: controller1,
                ),
                myTextFormField(
                  context: context,
                  controller: controller2,
                ),
                myTextFormField(
                  context: context,
                  controller: controller3,
                ),
                myTextFormField(
                  context: context,
                  controller: controller4,
                ),
                myTextFormField(
                  context: context,
                  controller: controller5,
                ),
                myTextFormField(
                  context: context,
                  controller: controller6,
                ),
                myTextFormField(
                  context: context,
                  controller: controller7,
                ),
                myTextFormField(
                  context: context,
                  controller: controller8,
                ),
                myMaterialButton(
                  context: context,
                  onPressed: (){
                    if(formKey.currentState!.validate()){
                      TestCubit.get(context).testModel(
                          name: controller1.text,
                          email: controller2.text,
                          nationalId: controller3.text,
                          phone: controller4.text,
                          gender: controller5.text,
                          age: controller6.text,
                          password: controller7.text,
                          password2: controller8.text,
                      );
                    }
                  },
                ),
                if(TestCubit.get(context).prediction == "0")
                  const Text("State is kareem"),
                if(TestCubit.get(context).prediction == "1")
                  const Text("State is Moustafa"),
              ],
            ),
          ),
        );
      },
    );
  }
}
