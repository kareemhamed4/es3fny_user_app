import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/modules/login/login_screen.dart';
import 'package:es3fny_user_app/network/local/cache_helper.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String header;
  final String body;

  BoardingModel({
    required this.image,
    required this.header,
    required this.body,
  });
}

//ignore: must_be_immutable
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/light logo red.png',
      header: 'Emerg-e-care',
      body: 'نقرة واحدة يمكن أن تنقذ حياتك!',
    ),
    BoardingModel(
      image: 'assets/images/tracking.png',
      header: 'تتبع مباشر',
      body: 'يمكنك تتبع تقدم الإسعاف بشكل مباشر',
    ),
    BoardingModel(
      image: 'assets/images/family.png',
      header: 'إبلاغ العائلة',
      body: 'نبقي عائلتك مطلعة على كل شيء من خلال توفير اسم وعنوان المستشفى التي تتوجه إليها',
    ),
    BoardingModel(
      image: 'assets/images/helpServices.png',
      header: 'الخدمات المساعدة',
      body: 'كما نوفر الكثير من الخدمات المساعدة (التنبؤ بالأمراض الخطيرة، التذكير بموعد الدواء، أقرب مستشفى،أقرب صيدلية، أقرب عيادة طبيب، ...)',
    ),
    BoardingModel(
      image: 'assets/images/chatbotService.png',
      header: 'طبيبك الذكي',
      body: 'نوفر لك روبوت ذكي للتحدث معه لتوفير كافة الإسعافات الأولية',
    ),
    BoardingModel(
      image: 'assets/images/blind.png',
      header: 'قادرون بإختلاف',
      body: 'كما قمنا بدمج تقنية الذكاء الاصطناعي المتطورة في Emerg-e-care، مما يتيح للمرضى طلب سيارة إسعاف من خلال الأوامر الصوتية.',
    ),
  ];

  PageController pageController = PageController();

  bool isLast = false;
  /*@override
  void initState() {
    disableCapture();
    super.initState();
  }*/
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          actions : [
              myTextButton(context: context, label: "onboarding_skip".tr(context), onPressed: () {
                CacheHelper.saveData(key: "onBoarding", value: true).then((value){
                  NavigateTo(context: context, widget: LoginScreen());
                });
              }),
      ]
    ),
      body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: pageController,
                  itemBuilder: (context, index) => buildPageViewScreen(
                      context: context, size: size, model: boarding[index]),
                  itemCount: boarding.length,
                  onPageChanged: (index) {
                    if (index == (boarding.length - 1)) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                ),
              ),
              SmoothPageIndicator(
                controller: pageController,
                count: boarding.length,
                effect: ExpandingDotsEffect(
                  expansionFactor: 5,
                  activeDotColor: myFavColor,
                  dotColor: Colors.grey,
                  dotHeight: 5,
                  dotWidth: 5,
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              onBoardingMaterialButton(
                context: context,
                onPressed: () {
                  if (isLast) {
                     CacheHelper.saveData(key: "onBoarding", value: true).then((value){
                      NavigateToReb(context: context, widget: LoginScreen());
                    });
                    NavigateTo(context: context, widget: LoginScreen());
                  } else {
                    pageController.nextPage(
                      duration: const Duration(
                        milliseconds: 750,
                      ),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                  }
                },
                label: !isLast ? 'onboarding_next'.tr(context) : 'onboarding_finish'.tr(context),
              ),
            ],
          )),
    );
  }
  /*Future<void> disableCapture() async {
    //disable screenshots and record screen in current screen
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }*/
}

Widget buildPageViewScreen({
  required BuildContext context,
  required Size size,
  required BoardingModel model,
}) =>
    Column(
      children: [
        Expanded(child: Image(image: AssetImage(model.image))),
        SizedBox(
          height: size.height * 0.05,
        ),
        Text(
          model.header,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
        ),
        SizedBox(
          height: size.height * 0.04,
        ),
        Text(
          model.body,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.caption,
        ),
        SizedBox(
          height: size.height * 0.1,
        ),
      ],
    );
