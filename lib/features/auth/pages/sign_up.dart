import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:graduation_project/core/shared/widgets/custom_textformfield.dart';
import 'package:graduation_project/features/auth/controller/sign_up_controller.dart';
import 'package:graduation_project/features/auth/pages/sign_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> formState = GlobalKey();
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passswordController;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passswordController.dispose();
    super.dispose();
  }

  bool isShow = false;
  bool isObscure = true;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SignUpController>(
        init: SignUpController(),

        builder: (controller) {
          return Container(
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              bottom: 20.h,
              top: 150.h,
            ),
            color: const Color(0xfff6f6f6),

            child: SingleChildScrollView(
              child: Form(
                key: formState,
                child: Column(
                  children: [
                    Text(
                      "إنشاء حساب جديد",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 40.h),
                    CustomTextFormFeild(
                      controller: nameController,
                      textAlign: TextAlign.start,
                      width: 385.w,
                      height: 100.h,
                      labelText: "الاسم",
                      prefix: Icon(
                        Icons.person,
                        color: const Color(0xFFb3de00),
                        size: 20.r,
                      ),
                    ),

                    CustomTextFormFeild(
                      controller: emailController,

                      textAlign: TextAlign.start,
                      errortext: controller.emailError,
                      width: 385.w,
                      height: 100.h,
                      labelText: "البريد الإلكتروني",
                      prefix: Icon(
                        Icons.email,
                        color: const Color(0xFFb3de00),
                        size: 20.r,
                      ),
                    ),

                    CustomTextFormFeild(
                      controller: passswordController,
                      textAlign: TextAlign.start,
                      errortext: controller.passwordError,
                      width: 385.w,
                      height: 100.h,

                      obscureText: isObscure,
                      labelText: "كلمة المرور",
                      maxLength: 8,
                      keyboardType: TextInputType.text,
                      prefix: Icon(
                        Icons.lock,
                        color: const Color(0xFFb3de00),
                        size: 20.r,
                      ),

                      sufix: IconButton(
                        onPressed: () {
                          setState(() {
                            isShow = !isShow;
                            isObscure = !isObscure;
                          });
                        },
                        icon: Icon(
                          isShow ? Icons.visibility : Icons.visibility_off,
                          color: const Color(0xFFb3de00),
                          size: 20.r,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),

                    SizedBox(
                      height: 60.h,
                      width: 230.w,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                        ),

                        onPressed: () {
                          controller.createAccount(
                            email: emailController.text,
                            password: passswordController.text,
                          );
                        },
                        child: Text(
                          "إنشاء حساب",
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(color: Colors.white),
                        ),
                      ),
                    ),

                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignIn()),
                            );
                          },

                          child: Text(
                            "تسجيل الدخول ",
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "لــدي حســاب ؟",
                          style: Theme.of(context).textTheme.bodySmall!
                              .copyWith(color: Colors.black54),
                        ),
                      ],
                    ),
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
