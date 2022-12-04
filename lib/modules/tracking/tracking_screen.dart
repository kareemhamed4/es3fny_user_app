import 'package:es3fny_user_app/modules/tracking_info/tracking_info_screen.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: myFavColor,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: Center(
                  child: Text(
                    "العمليات السابقة",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 18),
                  ),
                ),
              ),
            ),
            expandedHeight: 370,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset("assets/images/Map.png",fit: BoxFit.cover,width: double.maxFinite,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,bottom: 60),
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("اضغط للتتبع",style: Theme.of(context).textTheme.button!.copyWith(fontSize: 18),),
                                const Icon(Icons.arrow_forward,color: Colors.white,),
                              ],
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context,index) => buildHistoryItem(),
                    separatorBuilder: (context,index) => const SizedBox(height: 8,),
                    itemCount: 8,
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
  //default code for this page
  /*
  Column buildTrackingPage({required BuildContext context}) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const Image(image: AssetImage("assets/images/Map2.png"),fit: BoxFit.cover,),
          Padding(
            padding: const EdgeInsets.all(16),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("اضغط للتتبع",style: Theme.of(context).textTheme.button!.copyWith(fontSize: 18),),
                        const Icon(Icons.arrow_forward,color: Colors.white,),
                      ],
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
              ],
            ),
          ),
        ],
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Text(
                "العمليات السابقة",
                style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 18),
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
  );
*/
}
