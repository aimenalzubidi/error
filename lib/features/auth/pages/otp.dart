import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(15.w, 100.h, 15.w, 15.h),
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,

        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("OTP Code", style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 40.h),
              SvgPicture.asset(
                "assets/images/svg/otp-2.svg",
                width: 250.w,
                height: 250.h,
              ),

              SizedBox(height: 40.h),

              Text(
                "إدخل كود التحقق ",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 15.h),

              Text(
                " ستصلك رسالة على هاتفك مكونة من 6 أرقام قم بإدخالها في الأسفل للتحقق من صحة رقم هاتفك او بريدك الإلكتروني",
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(color: Colors.black54),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 15.h),

              Pinput(
                preFilledWidget: Text(
                  "0",
                  style: TextStyle(color: Colors.black26),
                ),
                defaultPinTheme: PinTheme(
                  height: 70.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(color: Color(0xFFb3de00)),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  height: 70.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(color: Color(0xFFb3de00), width: 3.w),
                  ),
                ),

                length: 6,
              ),

              SizedBox(height: 30.h),

              SizedBox(
                height: 60.h,
                width: 330.w,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isLoading = true;
                      Future.delayed(Duration(seconds: 3), () {
                        // ignore: use_build_context_synchronously
                        //  Navigator.pushReplacementNamed(context, "AddEmergencyContact");
                        //   isLoading=false;
                      });
                    });
                  },
                  child: isLoading
                      ? SizedBox(
                          height: 25.h,
                          width: 25.w,
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 3,
                          ),
                        )
                      : Text(
                          "تحقق",
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(color: Colors.white),
                        ),
                ),
              ),
              SizedBox(height: 15.h),
              SizedBox(
                height: 60.h,
                width: 330.w,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: const Color(0xFFb3de00)),
                  ),

                  onPressed: () {
                    //  Navigator.of(context).pushReplacementNamed("Login");
                  },
                  child: Text(
                    "عودة إلى صفحة تسجيل الدخول",
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall!.copyWith(color: Colors.black54),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
