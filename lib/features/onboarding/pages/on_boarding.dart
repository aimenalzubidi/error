import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../auth/pages/sign_up.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});
  @override
  State<OnBoarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<OnBoarding> {
  final PageController pageconroller = PageController();

  final List<List<String>> onboardingData = [
    [
      "assets/images/svg/onboarding-1.svg",
      "تطبيق إبلاغ",
      "أهلاً بك في تطبيق إبلاغ التابع للدفاع المدني-وادي حضرموت أمانك أولويتنا",
    ],
    [
      "assets/images/svg/onboarding-2.svg",
      "كــن أمـــن",
      "سلامتك مسؤوليتنا ...وتعاونك يصنع الفارق",
    ],

    [
      "assets/images/svg/onboarding-3.svg",
      "حالة الطقس",
      "إبقَ على إطلاع دائم بالتغيرات المناخية لحماية نفسك والاخرين",
    ],
    [
      "assets/images/svg/onboarding-4.svg",
      "المناطق الخطرة",
      "الأمان يبدأ بمعرفة المناطق الخطرة ومعرفتك تبدأ من هنا",
    ],

    [
      "assets/images/svg/onboarding-5.svg",
      "مساعد ذكي -AI",
      "إسأل عن أي طارئ...واتبع الإجرء الصحيح فوراً",
    ],
  ];

  String nextButton = "التالي";
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(20.w, 20, 20.w, 50.h),
        child: Stack(
          children: [
            PageView(
              onPageChanged: (index) {
                pageIndex = index;
                setState(() {
                  if (index == 4) {
                    nextButton = "تسجيل الدخول";
                  } else {
                    nextButton = "التالي";
                  }
                });
              },
              controller: pageconroller,
              children: [
                PageviewContainer(
                  onboardingData[0][0],
                  onboardingData[0][1],
                  onboardingData[0][2],
                ),
                PageviewContainer(
                  onboardingData[1][0],
                  onboardingData[1][1],
                  onboardingData[1][2],
                ),
                PageviewContainer(
                  onboardingData[2][0],
                  onboardingData[2][1],
                  onboardingData[2][2],
                ),
                PageviewContainer(
                  onboardingData[3][0],
                  onboardingData[3][1],
                  onboardingData[3][2],
                ),
                PageviewContainer(
                  onboardingData[4][0],
                  onboardingData[4][1],
                  onboardingData[4][2],
                ),
              ],
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SmoothPageIndicator(
                    controller: pageconroller,
                    count: 5,
                    effect: ExpandingDotsEffect(
                      activeDotColor: const Color(0xFFb3de00),

                      dotColor: const Color(0xffe8e8e8),
                      dotWidth: 15.w,
                      dotHeight: 15.h,
                      expansionFactor: 2,
                    ),
                    onDotClicked: (index) {
                      pageconroller.animateToPage(
                        index,
                        duration: const Duration(seconds: 1),
                        curve: Curves.ease,
                      );
                    },
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 60.h,
                        width: 130.w,

                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: const Color(0xFFb3de00)),
                          ),
                          onPressed: () {
                            pageconroller.animateToPage(
                              4,
                              duration: const Duration(seconds: 3),
                              curve: Curves.ease,
                            );
                          },
                          child: Text(
                            "تخطي",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                      SizedBox(width: 50.h),

                      SizedBox(
                        height: 60.h,
                        width: 200.w,

                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFb3de00),
                          ),
                          onPressed: () {
                            if (pageIndex == 4) {
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                              // Navigator.of(
                              //   context,
                              // ).pushReplacementNamed("Login");
                            }
                            pageconroller.nextPage(
                              duration: const Duration(seconds: 1),
                              curve: Curves.ease,
                            );
                          },
                          child: Text(
                            nextButton,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: Colors.white,fontWeight: FontWeight.bold),
                                
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageviewContainer extends StatelessWidget {
  const PageviewContainer(
    this.imagePathe,
    this.pageviewTitle,
    this.pageviewDescription, {
    super.key,
  });

  final String imagePathe;
  final String pageviewTitle;
  final String pageviewDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 100.h, left: 20.w, right: 20.w),
      color: const Color(0xfff6f6f6),
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              imagePathe,
              fit: BoxFit.contain,
              height: 350.h,
              width: 350.w,
            ),
            SizedBox(height: 50.h),
            Text(
              pageviewTitle,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            Text(
              pageviewDescription,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.black54),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
