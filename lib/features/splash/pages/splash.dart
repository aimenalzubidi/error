import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../auth/pages/sign_up.dart';
import '../../onboarding/pages/on_boarding.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    navigateNext();
  }

  Future<void> navigateNext() async {
    await Future.delayed(Duration(seconds: 5));

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (isFirstTime) {
      await prefs.setBool('isFirstTime', false);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => OnBoarding()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => SignUp()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 181, 218, 49),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(150.r),

          child: SvgPicture.asset("assets/images/svg/logo.svg", width: 250.w)
              .animate()
              .fadeIn(duration: Duration(seconds: 2))
              .fadeOut(
                delay: Duration(seconds: 4),
                // duration: Duration(seconds: 2),
              ),
        ),
      ),
    );
  }
}
