import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:graduation_project/core/util/validator.dart';
import 'package:graduation_project/features/auth/controller/sign_in_controller.dart';
import 'package:graduation_project/features/main_app/home/pages/home_screen.dart';
import 'package:graduation_project/sign_in_methodes/sign_in_google.dart';
import 'package:remixicon/remixicon.dart';

import 'package:graduation_project/core/shared/widgets/custom_textformfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});
  @override
  State<SignIn> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignIn> {
  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GoogleAuthService _authService = GoogleAuthService();
  bool isShow = true;
  bool isObscure = true;
  bool isLoading = false;
  Set _selected = {"user"};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SignInController>(
        init: SignInController(),
        builder: (controller) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(20.w, 70.h, 20.w, 2.h),
            color: const Color(0xfff6f6f6),

            child: SingleChildScrollView(
              child: Form(
                key: formState,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      "assets/images/svg/login-1.svg",
                      width: 210.w,
                      height: 210.h,
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      "تسجيل الدخول",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 15.h),

                    SegmentedButton(
                      selected: _selected,

                      onSelectionChanged: (segmentSelected) {
                        setState(() {
                          _selected = segmentSelected;
                          log("$segmentSelected");
                        });
                      },

                      style: SegmentedButton.styleFrom(
                        selectedBackgroundColor: const Color(0xFFb3de00),
                        selectedForegroundColor: Colors.black,
                        textStyle: Theme.of(
                          context,
                        ).textTheme.bodySmall!.copyWith(color: Colors.black54),
                        side: BorderSide(color: const Color(0xFFb3de00)),
                      ),
                      segments: <ButtonSegment>[
                        ButtonSegment(value: "user", label: Text("مستخدم")),
                        ButtonSegment(value: "admin", label: Text("أدمــــن")),
                      ],
                    ),

                    SizedBox(height: 30.h),
                    CustomTextFormFeild(
                      errortext: controller.phoneerror,
                      textAlign: TextAlign.start,
                      width: 385.w,
                      height: 100.h,

                      controller: phoneController,
                      labelText: "رقم الهاتف",
                      keyboardType: TextInputType.number,
                      prefix: Icon(
                        Icons.phone_rounded,
                        color: const Color(0xFFb3de00),
                        size: 20.r,
                      ),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      maxLength: 9,
                      validator: (value) => Validator.mobileNo(value),

                      onChanged: (text) {
                        formState.currentState!.validate();
                      },
                    ),

                    SizedBox(height: 10.h),

                    CustomTextFormFeild(
                      errortext: controller.phoneerror,
                      textAlign: TextAlign.start,
                      width: 385.w,
                      height: 100.h,
                      controller: passwordController,

                      obscureText: isObscure,
                      labelText: "كلمة المرور",
                      maxLength: 8,
                      keyboardType: TextInputType.text,
                      prefix: Icon(
                        Icons.lock,
                        color: const Color(0xFFb3de00),
                        size: 20.r,
                      ),
                      validator: (value) => Validator.password(value),
                      onChanged: (text) {
                        formState.currentState!.validate();
                      },

                      sufix: IconButton(
                        onPressed: () {
                          setState(() {
                            isShow = !isShow;
                            isObscure = !isObscure;
                          });
                        },
                        icon: Icon(
                          isShow ? Icons.visibility_off : Icons.visibility,
                          color: const Color(0xFFb3de00),
                          size: 20.r,
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          // Navigator.of(
                          //   context,
                          // ).pushReplacementNamed("ForgetPassword");
                        },
                        child: Text(
                          "نسيت كلمة المرور",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 60.h,
                      width: 230.w,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            controller.signIn(
                              phone: phoneController.text,
                              password: passwordController.text,
                            );
                            isLoading = true;
                            Future.delayed(Duration(seconds: 3), () {
                              // ignore: use_build_context_synchronously
                              // Navigator.pushReplacementNamed(context, "OTP");
                              // isLoading = false;
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
                                "تسجيل الدخول",
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(color: Colors.white),
                              ),
                      ),
                    ),
                    SizedBox(height: 10.h),

                    Text(
                      "أو",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10.h),

                    SizedBox(
                      height: 60.h,
                      width: 370.w,
                      child: OutlinedButton.icon(
                        label: Text(
                          "تسجيل الدخول بإستخدام حساب قوقل",
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: Colors.black54,
                                fontSize: 14.sp,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        icon: Icon(
                          RemixIcons.google_fill,
                          color: const Color(0xFFb3de00),
                          size: 35.r,
                        ),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(
                            color: const Color(0xFFb3de00),
                            width: .7,
                          ),
                        ),

                        onPressed: () async {
                          User? user = await _authService.signInWithGoogle();
                          // If sign-in is successful, navigate to the HomeScreen
                          if (user != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => HomeScreen(user: user),
                              ),
                            );
                          }
                        },
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            // Navigator.of(context).pushNamed("SignUp");
                          },

                          child: Text(
                            " إنشاء حساب ",
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "ليس لديك حساب ؟",
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: Colors.black54),
                        ),
                      ],
                    ),

                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
