import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:graduation_project/features/auth/controller/sign_in_controller.dart';
import 'package:graduation_project/features/auth/pages/forget_password.dart';
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
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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

                    SizedBox(height: 10.h),

                    CustomTextFormFeild(
                      errortext: controller.passwordError,
                      textAlign: TextAlign.start,
                      width: 385.w,
                      height: 100.h,
                      controller: passwordController,

                      obscureText: isObscure,
                      labelText: "كلمة المرور",
                      // maxLength: 8,
                      keyboardType: TextInputType.text,
                      prefix: Icon(
                        Icons.lock,
                        color: const Color(0xFFb3de00),
                        size: 20.r,
                      ),

                      // validator: (value) => Validator.password(value),
                      // onChanged: (text) {
                      //   formState.currentState!.validate();
                      // },
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgetPassword(),
                            ),
                          );
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
                          controller.signIn(
                            email: emailController.text,
                            password: passwordController.text,
                          );
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

                        onPressed: () {},
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
