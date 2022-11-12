import 'package:flutter/material.dart';

class TrackingInfoScreen extends StatelessWidget {
  TrackingInfoScreen({Key? key}) : super(key: key);
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        scaffoldKey.currentState!.showBottomSheet((context) {
          return Container(
            width: double.infinity,
            height: 353,
           decoration: const BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.only(
               topLeft: Radius.circular(20),
               topRight: Radius.circular(20),
             )
           ),
            child: Padding(
              padding: const EdgeInsets.only(right: 13),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.039,
                    ),
                    Text(
                      'تتبع الإسعاف',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontFamily: '3b8nyB',
                          ),
                    ),
                    SizedBox(
                      height: size.height*0.039,
                    ) ,
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/308888645_3298435880403234_8809857619090350383_n.jpeg'),
                      radius: 30,
                    )

                  ],
                ),
              ),
            ),
          );
        });
      },
      child: Scaffold(
        backgroundColor: Colors.teal,
        key: scaffoldKey,
      ),
    );
  }
}
