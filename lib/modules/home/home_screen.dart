import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/layout/cubit/cubit.dart';
import 'package:es3fny_user_app/layout/cubit/states.dart';
import 'package:es3fny_user_app/main_button/main_button.dart';
import 'package:es3fny_user_app/modules/edit_location/edit_location_screen.dart';
import 'package:es3fny_user_app/modules/profile/cubit/cubit.dart';
import 'package:es3fny_user_app/modules/profile/cubit/states.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/constants/constants.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<ProfileCubit,ProfileStates>(
      listener: (context,state){},
      builder: (context,state){
        ProfileCubit cubit = BlocProvider.of(context);
        return BlocConsumer<LayoutCubit,LayoutStates>(
          listener: (context,state){},
          builder: (context,state){
            return Scaffold(
              body: SafeArea(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Center(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      FluentIcons.person_circle_24_regular,
                                      size: 30,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ConditionalBuilder(
                                          condition: (cubit.userModel != null),
                                          builder: (context) => Text(
                                            "${"welcome".tr(context)}${cubit.splitSentence(cubit.userModel!.data!.name!)}..",
                                            /*"${"welcome".tr(context)}${cubit.userModel!.data!.name!.substring(0,4)}..",*/
                                            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16),
                                          ),
                                          fallback: (context) => Text(
                                            "welcome".tr(context),
                                            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16),
                                          ),
                                        ),
                                        const SizedBox(height: 6,),
                                        InkWell(
                                          onTap: (){
                                            LayoutCubit.get(context).changeIndex(3);
                                          },
                                          child: Text(
                                            "welcome_caption".tr(context),
                                            style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 12),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      FluentIcons.location_24_regular,
                                      size: 30,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "address".tr(context),
                                          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16),
                                        ),
                                        const SizedBox(height: 6,),
                                        InkWell(
                                          onTap: (){
                                            NavigateTo(context: context, widget: const EditLocationScreen());
                                          },
                                          child: Text(
                                            "address_caption".tr(context),
                                            style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 12),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              "need_ems".tr(context),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 27),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                              'need_ems_caption'.tr(context),
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const Spacer(),
                            const Center(child: LoadingButton()),
                            const Spacer(),
                            Text(
                              'fast_help'.tr(context),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!.copyWith(fontSize: 16),
                            ),
                            SizedBox(
                              height: size.height * 0.006,
                            ),
                            Text(
                              'fast_help_caption'.tr(context),
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: (){
                                        debugPrint(token);
                                      },
                                      child: SizedBox(
                                        height: size.height * 0.105,
                                        width: size.width * 0.36,
                                        child: Card(
                                          color: Theme.of(context).cardColor,
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "card_home_1".tr(context),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption!
                                                    .copyWith(fontSize: 16),
                                              ),
                                              const Icon(
                                                (Icons.arrow_forward),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: size.width * 0.077),
                                  Expanded(
                                    child: InkWell(
                                      onTap: (){
                                        debugPrint( "كيف أتصرف إذا وجدت شخصاً بالغاً أو طفلاً أو رضيعاً غائباً عن الوعي ؟\n - أهتم بسلامتك الشخصية أولا.\n - لاتقترب من موقع الحادث مطلقاً إذا كان غير امن\n - اطلب من الجمهور الإبتعاد عن موقع الحادث.\n - أسال الجمهور إذا كان أحدهم طبيب و فني خدمات إسعافية للمساعدة في انقاذ المصابين.\n - أسال الجمهور إذا كان أحدهم طبيب و فني خدمات إسعافية للمساعدة في انقاذ المصابين.\n - يمكن طلب المساعدة من أفراد الجمهور في اتباع\n\nالتعليمات الإسعافيه التي تحددها لهم للمساعده في\nانقاذ أكبر عدد من المصابين.\n- أجعل المكان آمنا.\n- أهتم بسلامة المصاب.\nكيف أفحص المصاب ؟\n- اختبر درجة الوعي لتحديد إذا ماكان واعي أم غير واع.\nسأل المصاب ماذا بك بصوت مرتفع فإن لم يستجيب للمنبه الكلامى. حاول حك عظمة القص ) عظمة منتصف الصدر بإصبعك مرات عدة مع تكرار سؤالك ماذا بك. فإن لم يستجيب للمنبه الكلامي والألمى يكون المصاب غير واع وإذا استجاب للمنبه الكلامي يكون المصاب واعياً.\n\nالفحص السريع للمصاب غير الواعي: ماذا أفعل إذا تأكدت أن المصاب غير واع؟\n\nاتبع سلسلة انقاذ الحياة للبالغين هي كالتالي : - الاتصال المبكر على الرقم (123)هيئة الاسعاف المصريه.\n- فحص التنفس.\n- الإنعاش القلبي الرئوي المبكر في حال كان المريض لا يتنفس\n- استعمال جهاز ازالة الرجفان البطيني إذا وجد.\n- وصول الفرقة الإسعافية.\nفحص التنفس\nيتم فحص تنفس المريض من خلال النظر إلى صدر المريض لمراقبة ارتفاع وهبوط الصدر. حركة الصدر بالهبوط والارتفاع دلالة على وجود النبض لذلك يكتفى بفحص التنفس دون الحاجة لفحص النبض.\n\nملاحظة :\nالفترة الزمنية لفحص التنفس من ٥ - ١٠ ثواني\n");
                                      },
                                      child: SizedBox(
                                        height: size.height * 0.105,
                                        width: size.width * 0.36,
                                        child: Card(
                                          color: Theme.of(context).cardColor,
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "card_home_2".tr(context),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption!
                                                    .copyWith(fontSize: 16),
                                              ),
                                              const Icon(
                                                (Icons.arrow_forward),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
            );
          },
        );
      },
    );
  }
}
