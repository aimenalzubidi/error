import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:graduation_project/features/auth/pages/sign_in.dart';
import 'package:graduation_project/features/auth/pages/sign_up.dart';
import 'package:graduation_project/firebase_options.dart';

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
