import 'package:flutter/material.dart';

import '../shared/components/components.dart';

class test extends StatelessWidget {
  const test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: (
                Column(
                  children: [
                    myTextFormField(
                      validate: (value) {
                        if (value!.length < 8) {
                          return "برجاء ادخال الاسم رباعي";
                        }
                        return null;
                      },
                      context: context,
                      textAlign: TextAlign.right,
                      type: TextInputType.text,
                      onSubmit: () {},
                    ),

                    SizedBox(
                      height: size.height * 0.0219,
                    ),
                    myTextFormField(
                      validate: (value) {
                        if (value!.length < 8) {
                          return "برجاء ادخال الاسم رباعي";
                        }
                        return null;
                      },
                      context: context,
                      textAlign: TextAlign.right,
                      type: TextInputType.text,
                      onSubmit: () {},
                    ),
                    SizedBox(
                      height: size.height * 0.0219,
                    ),
                    myTextFormField(
                      validate: (value) {
                        if (value!.length < 8) {
                          return "برجاء ادخال الاسم رباعي";
                        }
                        return null;
                      },
                      context: context,
                      textAlign: TextAlign.right,
                      type: TextInputType.text,
                      onSubmit: () {},
                    ),
                    SizedBox(
                      height: size.height * 0.0219,
                    ),
                    myTextFormField(
                      validate: (value) {
                        if (value!.length < 8) {
                          return "برجاء ادخال الاسم رباعي";
                        }
                        return null;
                      },
                      context: context,
                      textAlign: TextAlign.right,
                      type: TextInputType.text,
                      onSubmit: () {},
                    ),
                    SizedBox(
                      height: size.height * 0.0219,
                    ),

                    myTextFormField(
                      validate: (value) {
                        if (value!.length < 8) {
                          return "برجاء ادخال الاسم رباعي";
                        }
                        return null;
                      },
                      context: context,
                      textAlign: TextAlign.right,
                      type: TextInputType.text,
                      onSubmit: () {},
                    ),
                    SizedBox(
                      height: size.height * 0.0219,
                    ),

                    myTextFormField(
                      validate: (value) {
                        if (value!.length < 8) {
                          return "برجاء ادخال الاسم رباعي";
                        }
                        return null;
                      },
                      context: context,
                      textAlign: TextAlign.right,
                      type: TextInputType.text,
                      onSubmit: () {},
                    ),
                    SizedBox(
                      height: size.height * 0.0219,
                    ),

                    myTextFormField(
                      validate: (value) {
                        if (value!.length < 8) {
                          return "برجاء ادخال الاسم رباعي";
                        }
                        return null;
                      },
                      context: context,
                      textAlign: TextAlign.right,
                      type: TextInputType.text,
                      onSubmit: () {},
                    ),
                    SizedBox(
                      height: size.height * 0.0219,
                    ),

                    myTextFormField(
                      validate: (value) {
                        if (value!.length < 8) {
                          return "برجاء ادخال الاسم رباعي";
                        }
                        return null;
                      },
                      context: context,
                      textAlign: TextAlign.right,
                      type: TextInputType.text,
                      onSubmit: () {},
                    ),
                    SizedBox(
                      height: size.height * 0.0219,
                    ),

                    myTextFormField(
                      validate: (value) {
                        if (value!.length < 8) {
                          return "برجاء ادخال الاسم رباعي";
                        }
                        return null;
                      },
                      context: context,
                      textAlign: TextAlign.right,
                      type: TextInputType.text,
                      onSubmit: () {},
                    ),
                    SizedBox(
                      height: size.height * 0.0219,
                    ),

                    myTextFormField(
                      validate: (value) {
                        if (value!.length < 8) {
                          return "برجاء ادخال الاسم رباعي";
                        }
                        return null;
                      },
                      context: context,
                      textAlign: TextAlign.right,
                      type: TextInputType.text,
                      onSubmit: () {},
                    ),
                    SizedBox(
                      height: size.height * 0.0219,
                    ),

                    myTextFormField(
                      validate: (value) {
                        if (value!.length < 8) {
                          return "برجاء ادخال الاسم رباعي";
                        }
                        return null;
                      },
                      context: context,
                      textAlign: TextAlign.right,
                      type: TextInputType.text,
                      onSubmit: () {},
                    ),
                    SizedBox(
                      height: size.height * 0.0219,
                    ),

                    myTextFormField(
                      validate: (value) {
                        if (value!.length < 8) {
                          return "برجاء ادخال الاسم رباعي";
                        }
                        return null;
                      },
                      context: context,
                      textAlign: TextAlign.right,
                      type: TextInputType.text,
                      onSubmit: () {},
                    ),
                    SizedBox(
                      height: size.height * 0.0219,
                    ),

                    myTextFormField(
                      validate: (value) {
                        if (value!.length < 8) {
                          return "برجاء ادخال الاسم رباعي";
                        }
                        return null;
                      },
                      context: context,
                      textAlign: TextAlign.right,
                      type: TextInputType.text,
                      onSubmit: () {},
                    ),
                    SizedBox(
                      height: size.height * 0.0219,
                    ),
                    myMaterialButton(
                      context: context,
                      onPressed: () {

                      },
                      label: "دخول",
                    ),
                  ],
                )


            ),
          ),
        ),
      ),
    );
  }
}
