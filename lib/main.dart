import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:graduation_project/features/auth/pages/forget_password.dart';
import 'package:graduation_project/features/auth/pages/otp.dart';
import 'package:graduation_project/features/auth/pages/sign_in.dart';
import 'package:graduation_project/features/auth/pages/sign_up.dart';
import 'package:graduation_project/features/report/pages/report_page.dart';
import 'package:graduation_project/firebase_options.dart';
import 'features/emergency_contact/pages/add_emergency_contact.dart';
import 'features/main_app/dashboard_page/dashboard_page.dart';
import 'features/splash/pages/splash.dart';
import 'features/auth/pages/forget_password.dart';
import 'features/auth/pages/otp.dart';
import 'features/auth/pages/sign_in.dart';
import 'features/auth/pages/sign_up.dart';
import 'features/main_app/danger_zones/pages/danger_zones.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(448, 998),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          theme: ThemeData(
            fontFamily: "Cairo",
            textTheme: TextTheme(
              titleLarge: TextStyle(
                fontSize: 25.sp,
                color: const Color(0xFFb3de00),
                fontWeight: FontWeight.bold,
              ),
              titleMedium: TextStyle(
                fontSize: 20.sp,
                color: const Color(0xFFb3de00),
              ),
              titleSmall: TextStyle(
                fontSize: 15.sp,
                color: const Color(0xFFb3de00),
              ),
              bodyLarge: TextStyle(fontSize: 25.sp),
              bodyMedium: TextStyle(fontSize: 20.sp),
              bodySmall: TextStyle(fontSize: 15.sp),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFb3de00),
              ),
            ),
          ),
          routes: {},
          debugShowCheckedModeBanner: false,

          home: SignIn(),
        );
      },
    );
  }
}
