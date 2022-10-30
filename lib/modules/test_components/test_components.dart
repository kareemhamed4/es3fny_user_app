import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:flutter/material.dart';

class TestComponents extends StatefulWidget {
  const TestComponents({super.key});

  @override
  State<TestComponents> createState() => _TestComponentsState();
}

class _TestComponentsState extends State<TestComponents> {

  TextEditingController testController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              MyTextFormField(
                  controller: testController,
                  type: TextInputType.text,
                  validator: (value){
                    return null;
                  },
                  onTap: (){}
              ),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}