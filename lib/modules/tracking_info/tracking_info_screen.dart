import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

//ignore: must_be_immutable
class TrackingInfoScreen extends StatelessWidget {
  TrackingInfoScreen({Key? key}) : super(key: key);
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        showMyBottomSheet(context: context, size: size);
      },
      child: Scaffold(
        key: scaffoldKey,
        body: Stack(
          children: [
            const SizedBox(
              width: double.infinity,
                child: Image(
                    image: AssetImage("assets/images/Map.png"),
                  fit: BoxFit.cover,
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: GestureDetector(
                  onTap: (){
                    showMyBottomSheet(context: context, size: size);
                  },
                  child: Container(
                    width: 80,
                    height: 5,
                    decoration: BoxDecoration(
                      color: myFavColor2.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void showMyBottomSheet({required BuildContext context,required Size size}){
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        barrierColor: Colors.transparent,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
              right: 13,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.0172,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 80,
                        height: 5,
                        decoration: BoxDecoration(
                          color: myFavColor2.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.0172,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'تتبع الإسعاف',
                            style:
                            Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 22,
                            ),
                          ),
                          Text(
                            '(22 دقيقة)',
                            style:
                            Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 14,
                              color: myFavColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.039,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/308888645_3298435880403234_8809857619090350383_n.jpeg'),
                              radius: 30,
                            ),
                            SizedBox(
                              width: size.width * 0.03733,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'محمد عبد الغني',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(fontSize: 16),
                                ),
                                Text(
                                  'السائق',
                                  style:
                                  Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FluentIcons.call_16_regular,
                              color: myFavColor,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.0301,
                    ),
                    myDivider(),
                    SizedBox(
                      height: size.height * 0.0178,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: myFavColor.withOpacity(0.1),
                          child: Icon(
                            Icons.location_on_outlined,
                            color: myFavColor,
                            size: 16,
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.0293,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "العنوان",
                              style: Theme.of(context).textTheme.caption,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              "2972 Westheimer Rd. Santa Ana, Illinois 85486 ",
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.0178,
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 12),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: myFavColor.withOpacity(0.1),
                            child: Icon(
                              Icons.add_home_outlined,
                              color: myFavColor,
                              size: 16,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.0293,
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      end: 16),
                                  child: SizedBox(
                                    height: 50,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          filled: true,
                                          fillColor:
                                          myFavColor2.withOpacity(0.2),
                                          contentPadding: const EdgeInsets.only(right: 5),
                                          label: Text(
                                            "ادخل اسم المستشفي المقصودة (اختياري)",
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(fontSize: 12),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(5),
                                              borderSide: BorderSide(
                                                color: myFavColor2
                                                    .withOpacity(0.5),
                                              ))),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: SizedBox(
                                child: MaterialButton(
                                  height: 32,
                                  color: myFavColor,
                                  onPressed: () {},
                                  child: Text(
                                    "تأكيد",
                                    style:
                                    Theme.of(context).textTheme.button,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Align(
                        alignment: Alignment.center,
                        child: MaterialButton(
                          height: 32,
                          color: myFavColor,
                          onPressed: () {},
                          child: Text(
                            "الغاء الطلب",
                            style:
                            Theme.of(context).textTheme.button,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
