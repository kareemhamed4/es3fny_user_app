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
      image: 'assets/images/applogo.png',
      header: 'اسعفني',
      body: 'نقرة واحدة يمكن أن تنقذ حياتك!',
    ),
    BoardingModel(
      image: 'assets/images/tracking.png',
      header: 'تتبع مباشر',
      body: 'اسعفني يوفر خدمة معرفة مكان المريض والمسعف بشكل مباشر',
    ),
    BoardingModel(
      image: 'assets/images/friends.jpg',
      header: 'إبلاغ العائلة',
      body: 'اسعفني يقوم بإبلاغ عائلة المصاب بتفاصيل الحادث ومكان المستشفي الناقلة للمريض',
    ),
    BoardingModel(
      image: 'assets/images/findout.png',
      header: 'الخدمات المساعدة',
      body: 'اسعفني يوفر الكثير من الخدمات المساعدة (التنبؤ بالأمراض الخطيرة، الإسعافات الأولية، أقرب مستشفى، التذكير بموعد العلاج، ...)',
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
              myTextButton(context: context, label: "تخطي", onPressed: () {
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
                label: !isLast ? 'التالي' : 'البداية',
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
          style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: 18),
        ),
        SizedBox(
          height: size.height * 0.04,
        ),
        Text(
          model.body,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        SizedBox(
          height: size.height * 0.1,
        ),
      ],
    );
