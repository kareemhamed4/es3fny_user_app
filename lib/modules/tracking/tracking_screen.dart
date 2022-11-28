import 'package:es3fny_user_app/modules/tracking_info/tracking_info_screen.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "التتبع",
              style: Theme.of(context).textTheme.headline5!.copyWith(color: myFavColor),),
          ],
        ),
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              const Image(image: AssetImage("assets/images/Map2.png"),fit: BoxFit.cover,),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    children: [
                      Expanded(
                        child: MaterialButton(
                          onPressed: (){
                            NavigateTo(context: context, widget: const TrackingInfoScreen());
                          },
                          color: myFavColor,
                          height: 68,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("اضغط للتتبع",style: Theme.of(context).textTheme.button!.copyWith(fontSize: 18),),
                                const Icon(Icons.arrow_forward,color: Colors.white,),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12,),
                      Expanded(
                        child: MaterialButton(
                          onPressed: (){},
                          color: myFavColor,
                          height: 68,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                  text: " طنطا، الغربية\n",
                                  style: Theme.of(context).textTheme.button!.copyWith(fontSize: 16),
                                  children: [
                                    TextSpan(
                                      text: "منذ 4 دقائق",
                                      style: Theme.of(context).textTheme.button!.copyWith(fontSize: 14)
                                    ),
                                  ],
                                )),
                                const Icon(Icons.location_on_outlined,color: Colors.white,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "العمليات السابقة",
                    style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: 21),
                  ),
                  const SizedBox(height: 8,),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context,index) => buildHistoryItem(),
                        separatorBuilder: (context,index) => const SizedBox(height: 8,),
                        itemCount: 8,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      )
    ) ;
  }
  Widget buildHistoryItem() => Container(
    height: 94,
    width: double.infinity,
    decoration: BoxDecoration(
      color: myFavColor2.withOpacity(0.2),
      borderRadius: BorderRadius.circular(20),
    ),
  );
}
