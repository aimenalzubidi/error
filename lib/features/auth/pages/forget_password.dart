import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:graduation_project/core/shared/widgets/custom_textformfield.dart';
import 'package:graduation_project/features/auth/controller/sign_in_controller.dart';
import 'package:graduation_project/features/auth/pages/sign_in.dart';


class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  late TextEditingController emailController;

  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  bool isPasswordVisible = false;

  bool isShow = false;
  bool isScure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SignInController>(
        init: SignInController(),
        builder: (controller) => Container(
          padding: EdgeInsets.only(top: 70.h, left: 15.w, right: 15.w),
          width: double.infinity,
          height: double.infinity,
          color: const Color(0xfff6f6f6),

          child: SingleChildScrollView(
            child: Column(
              children: [
                SvgPicture.asset(
                  "assets/images/svg/forget-1.svg",
                  width: 230.w,
                  height: 230.h,
                ),

                SizedBox(height: 20.h),

                Text(
                  "تغيير كلمة المرور",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.end,
                ),
                SizedBox(height: 20.h),

                Form(
                  key: formState,
                  child: Column(
                    children: [
                      CustomTextFormFeild(
                        errortext: controller.emailError,
                        textAlign: TextAlign.start,
                        width: 385.w,
                        height: 100.h,

                        controller: emailController,
                        labelText: "البريد الإلكتروني",
                        keyboardType: TextInputType.emailAddress,
                        prefix: Icon(
                          Icons.email_outlined,
                          color: const Color(0xFFb3de00),
                          size: 20.r,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30.h),

                SizedBox(
                  height: 60.h,
                  width: 330.w,
                  child: ElevatedButton(
                    onPressed: () {
                      // if (formState.currentState!.validate()) {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => SizedBox()),
                      //   );
                      // }
                    },
                    child: Text(
                      "تأكيد",
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignIn()),
                      );
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
      ),
    );
  }
}
